import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/conversation.dart';
import '../entities/paginated_result.dart';
import '../repositoires/chat_repository.dart';

class FetchConversationsUseCase {
  final ChatRepository repository;

  FetchConversationsUseCase(this.repository);

  Future<Either<Failure, PaginatedResult<Conversation>>> call({
    int page = 1,
    int limit = 10,
  }) {
    return repository.fetchConversations(page: page, limit: limit);
  }
}
