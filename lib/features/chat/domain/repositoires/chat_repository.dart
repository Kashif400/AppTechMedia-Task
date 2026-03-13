import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/chat_stream_event.dart';
import '../entities/conversation.dart';
import '../entities/message.dart';
import '../entities/paginated_result.dart';

abstract class ChatRepository {
  /// Streams AI response chunks, completing with a [ChatComplete] event
  /// that carries the server-assigned conversationId and messageId.
  Future<Either<Failure, Stream<ChatStreamEvent>>> streamAiResponse({
    String? conversationId,
    required String message,
  });

  Future<Either<Failure, PaginatedResult<Message>>> fetchMessages({
    required String conversationId,
    int page = 1,
    int limit = 10,
  });

  Future<Either<Failure, PaginatedResult<Conversation>>> fetchConversations({
    int page = 1,
    int limit = 10,
  });
}
