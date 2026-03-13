import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/network/dio_client.dart';
import '../../../../core/utils/talker_service.dart';
import '../../domain/entities/chat_stream_event.dart';
import '../model/conversation_response.dart';
import '../model/messages_response.dart';

abstract class ChatRemoteDataSource {
  /// Posts to ai/chat and streams AI response chunks, completing with a
  /// [ChatComplete] event that carries the server-assigned conversationId.
  Stream<ChatStreamEvent> sendMessage({
    String? conversationId,
    required String message,
  });

  Future<MessagesResponse> fetchMessages({
    required String conversationId,
    int page = 1,
    int limit = 10,
  });
  Future<ConversationResponse> fetchConversations({
    int page = 1,
    int limit = 10,
  });
}

class ChatRemoteDataSourceImp implements ChatRemoteDataSource {
  final DioClient dioClient;
  final TalkerService _talker = GetIt.instance<TalkerService>();

  ChatRemoteDataSourceImp({required this.dioClient});

  @override
  Stream<ChatStreamEvent> sendMessage({
    String? conversationId,
    required String message,
  }) async* {
    try {
      final dio = await dioClient.launchDio();

      final response = await dio.post<ResponseBody>(
        '/ai/chat',
        data: {
          'conversation_id': conversationId,
          'message': message,
          'stream': true,
        },
        options: Options(
          responseType: ResponseType.stream,
          receiveTimeout: const Duration(minutes: 5),
        ),
      );

      if (response.statusCode != 200 || response.data == null) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Stream request failed with status ${response.statusCode}',
        );
      }

      // Track metadata returned by the server during the stream.
      String? resolvedConversationId = conversationId;
      String? resolvedMessageId;
      final buffer = StringBuffer();

      await for (final bytes in response.data!.stream) {
        buffer.write(utf8.decode(bytes, allowMalformed: true));

        final text = buffer.toString();
        buffer.clear();

        final lines = text.split('\n');

        // All lines except the last are complete; last may be partial.
        for (int i = 0; i < lines.length - 1; i++) {
          final line = lines[i].trim();
          if (line.isEmpty) continue;

          final parsed = _parseSseLine(line);
          if (parsed.conversationId != null) {
            resolvedConversationId = parsed.conversationId;
          }
          if (parsed.messageId != null) resolvedMessageId = parsed.messageId;
          if (parsed.content != null && parsed.content!.isNotEmpty) {
            yield ChatChunk(parsed.content!);
          }
        }

        // Keep the (possibly incomplete) last line for the next iteration.
        buffer.write(lines.last);
      }

      // Flush any remaining buffered text.
      final remaining = buffer.toString().trim();
      if (remaining.isNotEmpty) {
        final parsed = _parseSseLine(remaining);
        if (parsed.conversationId != null) {
          resolvedConversationId = parsed.conversationId;
        }
        if (parsed.messageId != null) resolvedMessageId = parsed.messageId;
        if (parsed.content != null && parsed.content!.isNotEmpty) {
          yield ChatChunk(parsed.content!);
        }
      }

      // Terminal event — carries server-assigned conversationId and messageId.
      yield ChatComplete(
        conversationId: resolvedConversationId,
        messageId: resolvedMessageId,
      );

      _talker.info('AI stream completed');
    } on DioException catch (e, stackTrace) {
      _talker.error('Failed to stream AI message: ${e.message} $stackTrace');
      rethrow;
    } catch (e, stackTrace) {
      _talker.error(
        'Unexpected error while streaming AI message: $e $stackTrace',
      );
      rethrow;
    }
  }

  /// Parses a single SSE line and returns content plus any server metadata.
  ///
  /// Returns null content if the line signals stream end ([DONE]) or has none.
  ({String? content, String? conversationId, String? messageId}) _parseSseLine(
    String line,
  ) {
    // SSE standard format: "data: <payload>"
    final String payload;
    if (line.startsWith('data: ')) {
      payload = line.substring(6).trim();
    } else {
      payload = line.trim();
    }

    if (payload == '[DONE]') {
      return (content: null, conversationId: null, messageId: null);
    }

    // Try to parse as JSON and extract content and metadata fields.
    try {
      final json = jsonDecode(payload) as Map<String, dynamic>;

      // Support both flat and nested { "data": { ... } } response shapes.
      final dataField = json['data'] as Map<String, dynamic>?;

      final convId =
          json['conversationId'] as String? ??
          json['conversation_id'] as String? ??
          dataField?['conversationId'] as String? ??
          dataField?['conversation_id'] as String?;
      final msgId =
          json['messageId'] as String? ??
          json['message_id'] as String? ??
          dataField?['messageId'] as String? ??
          dataField?['message_id'] as String?;

      // OpenAI-compatible format
      final openAiContent =
          json['choices']?[0]?['delta']?['content'] as String?;
      if (openAiContent != null) {
        return (
          content: openAiContent,
          conversationId: convId,
          messageId: msgId,
        );
      }

      // Generic formats used by various AI APIs.
      // Check nested data.message first so we get the actual AI reply
      // rather than a top-level status string like "Chat response generated successfully".
      final content =
          json['chunk'] as String? ??
          json['content'] as String? ??
          json['text'] as String? ??
          dataField?['message'] as String? ??
          (dataField == null ? json['message'] as String? : null);
      return (content: content, conversationId: convId, messageId: msgId);
    } catch (_) {
      // Not JSON — treat the raw payload as plain text content.
      return (content: payload, conversationId: null, messageId: null);
    }
  }

  @override
  Future<MessagesResponse> fetchMessages({
    required String conversationId,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await dioClient.get(
        endPoint: 'ai/chat/messages/$conversationId',
        params: {'page': page, 'limit': limit},
      );

      return MessagesResponse.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      _talker.error('Failed to fetch messages: ${e.message} $stackTrace');
      rethrow;
    } catch (e, stackTrace) {
      _talker.error('Unexpected error while fetching messages: $e $stackTrace');
      rethrow;
    }
  }

  @override
  Future<ConversationResponse> fetchConversations({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await dioClient.get(
        endPoint: 'ai/chat/conversations',
        params: {'page': page, 'limit': limit},
      );

      return ConversationResponse.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      _talker.error('Failed to fetch conversations: ${e.message} $stackTrace');
      rethrow;
    } catch (e, stackTrace) {
      _talker.error(
        'Unexpected error while fetching conversations: $e $stackTrace',
      );
      rethrow;
    }
  }
}

// class ChatRemoteDataSourceImp implements ChatRemoteDataSource {
//   final DioClient dioClient;
//   final TalkerService _talker = GetIt.instance<TalkerService>();

//   ChatRemoteDataSourceImp({required this.dioClient});

//   @override
//   Future<MessageModel> sendMessage({
//     String? conversationId,
//     required String message,
//   }) async {
//     try {
//       final response = await dioClient.post(
//         endPoint: 'ai/chat',

//         data: {'conversation_id': conversationId, 'message': message},
//       );

//       final data = response.data;

//       _talker.info('Message sent successfully');

//       return MessageModel.fromJson(data['data'] ?? data);
//     } on DioException catch (e, stackTrace) {
//       _talker.error('Failed to send message: ${e.message} $stackTrace');
//       rethrow;
//     } catch (e, stackTrace) {
//       _talker.error('Unexpected error while sending message: $e $stackTrace');
//       rethrow;
//     }
//   }

//   @override
//   Future<MessagesResponse> fetchMessages({
//     required String conversationId,
//     int page = 1,
//     int limit = 10,
//   }) async {
//     try {
//       final response = await dioClient.get(
//         endPoint: 'ai/chat/messages/$conversationId',
//         params: {'page': page, 'limit': limit},
//       );

//       return MessagesResponse.fromJson(response.data);
//     } on DioException catch (e, stackTrace) {
//       _talker.error('Failed to fetch messages: ${e.message} $stackTrace');
//       rethrow;
//     } catch (e, stackTrace) {
//       _talker.error('Unexpected error while fetching messages: $e $stackTrace');
//       rethrow;
//     }
//   }

//   @override
//   Future<ConversationResponse> fetchConversations({
//     int page = 1,
//     int limit = 10,
//   }) async {
//     try {
//       final response = await dioClient.get(
//         endPoint: 'ai/chat/conversations',
//         params: {'page': page, 'limit': limit},
//       );

//       return ConversationResponse.fromJson(response.data);
//     } on DioException catch (e, stackTrace) {
//       _talker.error('Failed to fetch conversations: ${e.message} $stackTrace');
//       rethrow;
//     } catch (e, stackTrace) {
//       _talker.error(
//         'Unexpected error while fetching conversations: $e $stackTrace',
//       );
//       rethrow;
//     }
//   }
// }
