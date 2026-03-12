import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/conversation.dart';
import '../entities/message.dart';
import '../entities/paginated_result.dart';

abstract class ChatRepository {
  Future<Either<Failure, Message>> sendMessage({
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
