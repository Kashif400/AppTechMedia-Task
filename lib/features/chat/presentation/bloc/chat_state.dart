part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final List<Conversation> conversations;
  final Status conversationsStatus;
  final bool hasMoreConversations;
  final int conversationsPage;

  final List<Message> messages;
  final Status messagesStatus;
  final bool hasMoreMessages;
  final int messagesPage;
  final String? selectedConversationId;

  final PostApiStatus sendMessageStatus;

  final String? errorMessage;

  const ChatState({
    this.conversations = const [],
    this.conversationsStatus = Status.completed,
    this.hasMoreConversations = false,
    this.conversationsPage = 1,
    this.messages = const [],
    this.messagesStatus = Status.completed,
    this.hasMoreMessages = false,
    this.messagesPage = 1,
    this.selectedConversationId = '',
    this.sendMessageStatus = PostApiStatus.initial,
    this.errorMessage,
  });

  ChatState copyWith({
    List<Conversation>? conversations,
    Status? conversationsStatus,
    bool? hasMoreConversations,
    int? conversationsPage,
    List<Message>? messages,
    Status? messagesStatus,
    bool? hasMoreMessages,
    int? messagesPage,
    String? selectedConversationId = '',
    PostApiStatus? sendMessageStatus,
    String? errorMessage = "",
  }) {
    return ChatState(
      conversations: conversations ?? this.conversations,
      conversationsStatus: conversationsStatus ?? this.conversationsStatus,
      hasMoreConversations: hasMoreConversations ?? this.hasMoreConversations,
      conversationsPage: conversationsPage ?? this.conversationsPage,
      messages: messages ?? this.messages,
      messagesStatus: messagesStatus ?? this.messagesStatus,
      hasMoreMessages: hasMoreMessages ?? this.hasMoreMessages,
      messagesPage: messagesPage ?? this.messagesPage,
      selectedConversationId:
          selectedConversationId ?? this.selectedConversationId,
      sendMessageStatus: sendMessageStatus ?? this.sendMessageStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    conversations,
    conversationsStatus,
    hasMoreConversations,
    conversationsPage,
    messages,
    messagesStatus,
    hasMoreMessages,
    messagesPage,
    selectedConversationId,
    sendMessageStatus,
    errorMessage,
  ];
}
