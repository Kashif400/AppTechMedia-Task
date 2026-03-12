part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object?> get props => [];
}

class FetchConversationsRequested extends ChatEvent {
  const FetchConversationsRequested();
}

class LoadMoreConversationsRequested extends ChatEvent {
  const LoadMoreConversationsRequested();
}

class FetchMessagesRequested extends ChatEvent {
  final String conversationId;

  const FetchMessagesRequested(this.conversationId);

  @override
  List<Object?> get props => [conversationId];
}

class LoadMoreMessagesRequested extends ChatEvent {
  const LoadMoreMessagesRequested();
}

class SendMessageRequested extends ChatEvent {
  final String? conversationId;
  final String message;

  const SendMessageRequested({this.conversationId, required this.message});

  @override
  List<Object?> get props => [conversationId, message];
}

class ContentChange extends ChatEvent {
  final String? message;
  const ContentChange({this.message});

  @override
  List<Object?> get props => [message];
}

class StartNewConversationRequested extends ChatEvent {
  const StartNewConversationRequested();
}
