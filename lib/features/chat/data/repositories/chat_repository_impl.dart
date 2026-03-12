import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/network/safe_api_call.dart';
import '../../../../core/utils/talker_service.dart';
import '../../domain/entities/conversation.dart';
import '../../domain/entities/message.dart';
import '../../domain/entities/paginated_result.dart';
import '../../domain/repositoires/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final _talker = GetIt.instance<TalkerService>();

  ChatRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Message>> sendMessage({
    String? conversationId,
    required String message,
  }) async {
    _talker.info(
      '💬 Sending message',
      data: {'conversationId': conversationId},
    );

    return safeApiCall(networkInfo, () async {
      final model = await remoteDataSource.sendMessage(
        conversationId: conversationId,
        message: message,
      );

      _talker.info('✅ Message sent successfully');
      return model.toEntity();
    });
  }

  @override
  Future<Either<Failure, PaginatedResult<Message>>> fetchMessages({
    required String conversationId,
    int page = 1,
    int limit = 10,
  }) async {
    _talker.info(
      '📩 Fetching messages',
      data: {'conversationId': conversationId, 'page': page, 'limit': limit},
    );

    return safeApiCall(networkInfo, () async {
      final response = await remoteDataSource.fetchMessages(
        conversationId: conversationId,
        page: page,
        limit: limit,
      );

      final messages = response.messages.map((m) => m.toEntity()).toList();

      _talker.info('✅ Fetched ${messages.length} messages');

      return PaginatedResult<Message>(
        items: messages,
        currentPage: response.pagination?.page,
        totalPages: response.pagination?.totalPages,
        totalItems: response.pagination?.total,
        limit: response.pagination?.limit,
        hasNextPage: response.pagination?.hasNextPage,
        hasPreviousPage: response.pagination?.hasPreviousPage,
      );
    });
  }

  @override
  Future<Either<Failure, PaginatedResult<Conversation>>> fetchConversations({
    int page = 1,
    int limit = 10,
  }) async {
    _talker.info(
      '📋 Fetching conversations',
      data: {'page': page, 'limit': limit},
    );

    return safeApiCall(networkInfo, () async {
      final response = await remoteDataSource.fetchConversations(
        page: page,
        limit: limit,
      );

      final conversations = response.conversations
          .map((c) => c.toEntity())
          .toList();

      _talker.info('✅ Fetched ${conversations.length} conversations');

      return PaginatedResult<Conversation>(
        items: conversations,
        currentPage: response.pagination?.page,
        totalPages: response.pagination?.totalPages,
        totalItems: response.pagination?.total,
        limit: response.pagination?.limit,
        hasNextPage: response.pagination?.hasNextPage,
        hasPreviousPage: response.pagination?.hasPreviousPage,
      );
    });
  }
}
