/// Events emitted by the AI streaming pipeline.
///
/// [ChatChunk] carries incremental text from the AI response.
/// [ChatComplete] is the terminal event carrying server-assigned metadata
/// (conversationId, messageId) so the BLoC can update local state without
/// a separate fetch.
sealed class ChatStreamEvent {}

final class ChatChunk extends ChatStreamEvent {
  final String text;
  ChatChunk(this.text);
}

final class ChatComplete extends ChatStreamEvent {
  final String? conversationId;
  final String? messageId;
  ChatComplete({this.conversationId, this.messageId});
}
