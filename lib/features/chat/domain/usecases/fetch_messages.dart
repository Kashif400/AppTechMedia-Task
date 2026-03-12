import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/message.dart';
import '../entities/paginated_result.dart';
import '../repositoires/chat_repository.dart';

class FetchMessagesUseCase {
  final ChatRepository repository;

  FetchMessagesUseCase(this.repository);

  Future<Either<Failure, PaginatedResult<Message>>> call({
    required String conversationId,
    int page = 1,
    int limit = 10,
  }) {
    return repository.fetchMessages(
      conversationId: conversationId,
      page: page,
      limit: limit,
    );
  }
}
