import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/network/dio_client.dart';
import '../../../../core/utils/talker_service.dart';
import '../model/conversation_response.dart';
import '../model/messages_response.dart';
import '../model/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<MessageModel> sendMessage({
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
  Future<MessageModel> sendMessage({
    String? conversationId,
    required String message,
  }) async {
    try {
      final response = await dioClient.post(
        endPoint: 'ai/chat',

        data: {'conversation_id': conversationId, 'message': message},
      );

      final data = response.data;

      _talker.info('Message sent successfully');

      return MessageModel.fromJson(data['data'] ?? data);
    } on DioException catch (e, stackTrace) {
      _talker.error('Failed to send message: ${e.message} $stackTrace');
      rethrow;
    } catch (e, stackTrace) {
      _talker.error('Unexpected error while sending message: $e $stackTrace');
      rethrow;
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
