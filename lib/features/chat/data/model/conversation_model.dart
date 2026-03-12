import '../../domain/entities/conversation.dart';

class ConversationModel {
  String? id;
  String? title;
  String? userId;
  String? createdAt;
  String? updatedAt;
  String? aiconversationType;

  ConversationModel({
    this.id,
    this.title,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.aiconversationType,
  });

  ConversationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    aiconversationType = json['aiconversationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['userId'] = userId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['aiconversationType'] = aiconversationType;
    return data;
  }

  Conversation toEntity() {
    return Conversation(
      id: id,
      title: title,
      userId: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      aiconversationType: aiconversationType,
    );
  }
}
