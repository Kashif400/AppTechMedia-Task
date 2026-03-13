import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/chat_stream_event.dart';
import '../repositoires/chat_repository.dart';

class StreamAiResponseUseCase {
  final ChatRepository repository;

  StreamAiResponseUseCase(this.repository);

  Future<Either<Failure, Stream<ChatStreamEvent>>> call({
    String? conversationId,
    required String message,
  }) {
    return repository.streamAiResponse(
      conversationId: conversationId,
      message: message,
    );
  }
}
