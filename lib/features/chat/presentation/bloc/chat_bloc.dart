import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/enum.dart';
import '../../domain/usecases/fetch_conversations.dart';
import '../../domain/usecases/fetch_messages.dart';
import '../../domain/usecases/send_message.dart';
import '../../domain/entities/conversation.dart';
import '../../domain/entities/message.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FetchConversationsUseCase fetchConversationsUseCase;
  final FetchMessagesUseCase fetchMessagesUseCase;
  final SendMessageUseCase sendMessageUseCase;

  ChatBloc({
    required this.fetchConversationsUseCase,
    required this.fetchMessagesUseCase,
    required this.sendMessageUseCase,
  }) : super(const ChatState()) {
    on<FetchConversationsRequested>(_onFetchConversations);
    on<LoadMoreConversationsRequested>(_onLoadMoreConversations);
    on<FetchMessagesRequested>(_onFetchMessages);
    on<LoadMoreMessagesRequested>(_onLoadMoreMessages);
    on<SendMessageRequested>(_onSendMessage);
    on<StartNewConversationRequested>(_onStartNewConversation);
  }

  Future<void> _onFetchConversations(
    FetchConversationsRequested event,
    Emitter<ChatState> emit,
  ) async {
    emit(
      state.copyWith(conversationsStatus: Status.loading, conversationsPage: 1),
    );

    final result = await fetchConversationsUseCase(page: 1);

    result.fold(
      (failure) => emit(
        state.copyWith(
          conversationsStatus: Status.error,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          conversationsStatus: Status.completed,
          conversations: data.items,
          hasMoreConversations: data.hasNextPage ?? false,
          conversationsPage: 1,
        ),
      ),
    );
  }

  Future<void> _onLoadMoreConversations(
    LoadMoreConversationsRequested event,
    Emitter<ChatState> emit,
  ) async {
    if (!state.hasMoreConversations) return;

    final nextPage = state.conversationsPage + 1;

    final result = await fetchConversationsUseCase(page: nextPage);

    result.fold(
      (failure) => emit(
        state.copyWith(
          conversationsStatus: Status.error,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          conversationsStatus: Status.completed,
          conversations: [...state.conversations, ...data.items],
          hasMoreConversations: data.hasNextPage ?? false,
          conversationsPage: nextPage,
        ),
      ),
    );
  }

  Future<void> _onFetchMessages(
    FetchMessagesRequested event,
    Emitter<ChatState> emit,
  ) async {
    emit(
      state.copyWith(
        messagesStatus: Status.loading,
        selectedConversationId: event.conversationId,
        messages: const [],
        messagesPage: 1,
        errorMessage: null,
      ),
    );

    final result = await fetchMessagesUseCase(
      conversationId: event.conversationId,
      page: 1,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          messagesStatus: Status.error,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          messagesStatus: Status.completed,
          messages: data.items,
          hasMoreMessages: data.hasNextPage ?? false,
          messagesPage: 1,
        ),
      ),
    );
  }

  Future<void> _onLoadMoreMessages(
    LoadMoreMessagesRequested event,
    Emitter<ChatState> emit,
  ) async {
    final conversationId = state.selectedConversationId;
    if (!state.hasMoreMessages || conversationId == null) return;

    final nextPage = state.messagesPage + 1;

    final result = await fetchMessagesUseCase(
      conversationId: conversationId,
      page: nextPage,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          messagesStatus: Status.error,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          messagesStatus: Status.completed,
          messages: [...state.messages, ...data.items],
          hasMoreMessages: data.hasNextPage ?? false,
          messagesPage: nextPage,
        ),
      ),
    );
  }

  Future<void> _onSendMessage(
    SendMessageRequested event,
    Emitter<ChatState> emit,
  ) async {
    final originalMessages = state.messages;
    final conversationId = event.conversationId ?? state.selectedConversationId;

    final userMessage = Message(
      conversationId: conversationId,
      role: 'user',
      content: event.message,
      messageType: 'text',
      createdAt: DateTime.now().toIso8601String(),
    );

    emit(
      state.copyWith(
        sendMessageStatus: PostApiStatus.loading,
        messages: [...originalMessages, userMessage],
        errorMessage: null,
      ),
    );

    final result = await sendMessageUseCase(
      conversationId: conversationId,
      message: event.message,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          sendMessageStatus: PostApiStatus.error,
          errorMessage: failure.message,
          messages: originalMessages,
        ),
      ),
      (aiMessage) {
        final newConversationId =
            aiMessage.conversationId ?? state.selectedConversationId;
        emit(
          ChatState(
            conversations: state.conversations,
            conversationsStatus: state.conversationsStatus,
            hasMoreConversations: state.hasMoreConversations,
            conversationsPage: state.conversationsPage,
            messages: [...state.messages, aiMessage],
            messagesStatus: state.messagesStatus,
            hasMoreMessages: state.hasMoreMessages,
            messagesPage: state.messagesPage,
            selectedConversationId: newConversationId,
            sendMessageStatus: PostApiStatus.success,
          ),
        );
        if (conversationId == null && newConversationId != null) {
          add(const FetchConversationsRequested());
        }
      },
    );
  }

  void _onStartNewConversation(
    StartNewConversationRequested event,
    Emitter<ChatState> emit,
  ) {
    emit(
      ChatState(
        conversations: state.conversations,
        conversationsStatus: state.conversationsStatus,
        hasMoreConversations: state.hasMoreConversations,
        conversationsPage: state.conversationsPage,
        messages: const [],
        messagesStatus: Status.completed,
        hasMoreMessages: false,
        messagesPage: 1,
        selectedConversationId: null,
        sendMessageStatus: PostApiStatus.initial,
      ),
    );
  }
}
