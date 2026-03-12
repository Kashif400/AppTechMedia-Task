import 'package:get_it/get_it.dart';

import '../../../../core/utils/talker_service.dart';
import 'conversation_model.dart';
import 'pagination_model.dart';

class ConversationResponse {
  final _talker = GetIt.instance<TalkerService>();

  List<ConversationModel> conversations = [];
  Pagination? pagination;

  ConversationResponse.fromJson(dynamic json) {
    try {
      _talker.info('FetchConversationResponse.fromJson: $json');

      // DioClient already unwraps response.data['data'], so json is
      // directly: { "conversations": [...], "pagination": {...} }
      final data = json as Map<String, dynamic>;

      final conversationsList = data['conversations'] as List? ?? [];
      conversations = conversationsList
          .map((e) => ConversationModel.fromJson(e as Map<String, dynamic>))
          .toList();

      if (data['pagination'] != null) {
        pagination = Pagination.fromJson(
          data['pagination'] as Map<String, dynamic>,
        );
      }

      _talker.info('✅ Parsed ${conversations.length} conversations');
    } catch (e, st) {
      _talker.error('FetchConversationResponse error: $e', stackTrace: st);
    }
  }
}
