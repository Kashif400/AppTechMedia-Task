import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String? id;
  final String? conversationId;
  final String? role;
  final String? content;
  final String? messageType;
  final String? createdAt;

  const Message({
    this.id,
    this.conversationId,
    this.role,
    this.content,
    this.messageType,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    conversationId,
    role,
    content,
    messageType,
    createdAt,
  ];

  Message copyWith({
    String? id,
    String? conversationId,
    String? role,
    String? content,
    String? messageType,
    String? createdAt,
  }) {
    return Message(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      role: role ?? this.role,
      content: content ?? this.content,
      messageType: messageType ?? this.messageType,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
