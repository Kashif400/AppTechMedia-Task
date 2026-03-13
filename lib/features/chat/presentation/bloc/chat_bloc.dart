import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/enum.dart';
import '../../domain/usecases/fetch_conversations.dart';
import '../../domain/usecases/fetch_messages.dart';
import '../../domain/usecases/stream_ai_response.dart';
import '../../domain/entities/chat_stream_event.dart';
import '../../domain/entities/conversation.dart';
import '../../domain/entities/message.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FetchConversationsUseCase fetchConversationsUseCase;
  final FetchMessagesUseCase fetchMessagesUseCase;
  final StreamAiResponseUseCase streamAiResponseUseCase;

  ChatBloc({
    required this.fetchConversationsUseCase,
    required this.fetchMessagesUseCase,
    required this.streamAiResponseUseCase,
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
    final originalMessages = List<Message>.from(state.messages);
    // Treat empty string as null (no existing conversation).
    final String? conversationId = (event.conversationId?.isNotEmpty == true)
        ? event.conversationId
        : (state.selectedConversationId?.isNotEmpty == true
              ? state.selectedConversationId
              : null);

    final userMessage = Message(
      conversationId: conversationId,
      role: 'user',
      content: event.message,
      messageType: 'text',
      createdAt: DateTime.now().toIso8601String(),
    );

    // Placeholder for the AI response that will be filled chunk by chunk.
    final aiPlaceholder = Message(
      id: '${DateTime.now().millisecondsSinceEpoch}_ai',
      conversationId: conversationId,
      role: 'assistant',
      content: '',
      messageType: 'text',
      createdAt: DateTime.now().toIso8601String(),
    );

    final withOptimistic = [...originalMessages, userMessage, aiPlaceholder];

    emit(
      state.copyWith(
        sendMessageStatus: PostApiStatus.loading,
        messages: withOptimistic,
        errorMessage: null,
      ),
    );

    final result = await streamAiResponseUseCase(
      conversationId: conversationId,
      message: event.message,
    );

    // Handle connection-level failure before streaming starts.
    if (result.isLeft()) {
      final failure = result.fold(
        (f) => f,
        (_) => throw StateError('unreachable'),
      );
      emit(
        state.copyWith(
          sendMessageStatus: PostApiStatus.error,
          errorMessage: failure.message,
          // Keep user message visible; discard the empty AI placeholder.
          messages: [...originalMessages, userMessage],
        ),
      );
      return;
    }

    final stream = result.getOrElse(() => Stream<ChatStreamEvent>.empty());
    String accumulated = '';
    List<Message> currentMessages = List.from(withOptimistic);
    // Will be updated from ChatComplete; falls back to the outgoing conversationId.
    String? newConversationId = conversationId;

    await emit.forEach<ChatStreamEvent>(
      stream,
      onData: (event) {
        if (event is ChatChunk) {
          accumulated += event.text;
          // Update the AI placeholder with the latest accumulated content.
          currentMessages = [
            ...currentMessages.sublist(0, currentMessages.length - 1),
            aiPlaceholder.copyWith(content: accumulated),
          ];
          return state.copyWith(
            sendMessageStatus: PostApiStatus.streaming,
            messages: List.from(currentMessages),
          );
        }
        if (event is ChatComplete) {
          // Capture the server-assigned conversationId.
          // Critical for new conversations where we sent conversationId == null.
          newConversationId = event.conversationId ?? newConversationId;
        }
        return state;
      },
      onError: (error, _) {
        // Keep the user's message visible; only discard the empty AI placeholder.
        return state.copyWith(
          sendMessageStatus: PostApiStatus.error,
          errorMessage: error.toString(),
          messages: [...originalMessages, userMessage],
        );
      },
    );

    // Emit success only if streaming did not end in an error.
    if (state.sendMessageStatus != PostApiStatus.error) {
      emit(
        state.copyWith(
          sendMessageStatus: PostApiStatus.success,
          // Pin the conversation to the server-returned (or pre-existing) id.
          selectedConversationId:
              newConversationId ?? state.selectedConversationId,
        ),
      );

      // Refresh conversation list when a new conversation was just created.
      if (conversationId == null) {
        add(const FetchConversationsRequested());
      }
    }
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
        selectedConversationId: '',
        sendMessageStatus: PostApiStatus.initial,
      ),
    );
  }
}
