import 'package:get_it/get_it.dart';

import '../../../../core/utils/talker_service.dart';
import 'message_model.dart';
import 'pagination_model.dart';

class MessagesResponse {
  final _talker = GetIt.instance<TalkerService>();

  List<MessageModel> messages = [];
  Pagination? pagination;

  MessagesResponse.fromJson(dynamic json) {
    try {
      _talker.info('FetchMessagesResponse.fromJson: $json');

      // DioClient already unwraps response.data['data'], so json is
      // directly: { "messages": [...], "pagination": {...} }
      final data = json as Map<String, dynamic>;

      final messagesList = data['messages'] as List? ?? [];
      messages = messagesList
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList();

      if (data['pagination'] != null) {
        pagination = Pagination.fromJson(
          data['pagination'] as Map<String, dynamic>,
        );
      }

      _talker.info('✅ Parsed ${messages.length} messages');
    } catch (e, st) {
      _talker.error('FetchMessagesResponse error: $e', stackTrace: st);
    }
  }
}
