import 'package:equatable/equatable.dart';

class Conversation extends Equatable {
  final String? id;
  final String? title;
  final String? userId;
  final String? createdAt;
  final String? updatedAt;
  final String? aiconversationType;

  const Conversation({
    this.id,
    this.title,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.aiconversationType,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    userId,
    createdAt,
    updatedAt,
    aiconversationType,
  ];

  Conversation copyWith({
    String? id,
    String? title,
    String? userId,
    String? createdAt,
    String? updatedAt,
    String? aiconversationType,
  }) {
    return Conversation(
      id: id ?? this.id,
      title: title ?? this.title,
      userId: userId ?? this.userId,

      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      aiconversationType: aiconversationType ?? this.aiconversationType,
    );
  }
}
