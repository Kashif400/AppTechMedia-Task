import '../../domain/entities/message.dart';

class MessageModel {
  String? id;
  String? conversationId;
  String? role;
  String? content;
  String? messageType;
  String? createdAt;

  MessageModel({
    this.id,
    this.conversationId,
    this.role,
    this.content,
    this.messageType,
    this.createdAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    conversationId = json['conversationId'];
    role = json['role'];
    content = json['content'] as String? ?? json['message'] as String?;
    messageType = json['messageType'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['conversationId'] = conversationId;
    data['role'] = role;
    data['content'] = content;
    data['messageType'] = messageType;

    data['createdAt'] = createdAt;
    return data;
  }

  Message toEntity() {
    return Message(
      id: id,
      conversationId: conversationId,
      role: role,
      content: content,
      messageType: messageType,
      createdAt: createdAt,
    );
  }
}
