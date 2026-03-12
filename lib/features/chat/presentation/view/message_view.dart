import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/enum.dart';
import '../../../../widget/dark_swich_button.dart';
import '../bloc/chat_bloc.dart';
import '../widget/chat_input_bar.dart';
import '../widget/conversation_drawer.dart';
import '../widget/message_list.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 120) {
      final bloc = context.read<ChatBloc>();
      final s = bloc.state;
      if (s.hasMoreMessages && s.messagesStatus != Status.loading) {
        bloc.add(const LoadMoreMessagesRequested());
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatBloc, ChatState>(
      listenWhen: (prev, curr) =>
          prev.sendMessageStatus != curr.sendMessageStatus &&
          curr.sendMessageStatus == PostApiStatus.success,
      listener: (_, _) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      },
      child: BlocBuilder<ChatBloc, ChatState>(
        buildWhen: (prev, curr) =>
            prev.selectedConversationId != curr.selectedConversationId ||
            prev.conversations != curr.conversations,
        builder: (context, state) {
          final selectedConv = state.conversations
              .where((c) => c.id == state.selectedConversationId)
              .firstOrNull;

          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu_rounded),
                tooltip: 'Conversations',
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
              title: Text(
                selectedConv?.title ?? 'AI Chat',
                overflow: TextOverflow.ellipsis,
              ),
              actions: [
                SizedBox(height: 35.h, child: DarkSwichButton()),
                10.horizontalSpace,
              ],
            ),
            drawer: const ConversationDrawer(),
            body: Column(
              children: [
                Expanded(
                  child: MessageList(scrollController: _scrollController),
                ),
                const ChatInputBar(),
              ],
            ),
          );
        },
      ),
    );
  }
}
