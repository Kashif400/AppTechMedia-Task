import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/enum.dart';
import '../../../../generated/assets.gen.dart';
import '../bloc/chat_bloc.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({super.key});

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<bool> _hasText = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    _hasText.value = _controller.text.trim().isNotEmpty;
  }

  @override
  void dispose() {
    _hasText.dispose();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _send(BuildContext context) {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final conversationId = context
        .read<ChatBloc>()
        .state
        .selectedConversationId;

    _controller.clear();

    context.read<ChatBloc>().add(
      SendMessageRequested(conversationId: conversationId, message: text),
    );

    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<ChatBloc, ChatState>(
      buildWhen: (prev, curr) =>
          prev.sendMessageStatus != curr.sendMessageStatus,
      builder: (context, state) {
        final isLoading =
            state.sendMessageStatus == PostApiStatus.loading ||
            state.sendMessageStatus == PostApiStatus.streaming;

        return SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: colorScheme.surface,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // ── Pill text field ────────────────────────────────────────
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    enabled: !isLoading,
                    minLines: 1,
                    maxLines: 3,

                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,

                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(
                      hintText: 'Type a message…',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                10.horizontalSpace,

                ValueListenableBuilder<bool>(
                  valueListenable: _hasText,
                  builder: (context, hasText, _) => GestureDetector(
                    key: const ValueKey('send'),
                    onTap: hasText ? () => _send(context) : null,
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 14.h,
                      ),
                      decoration: BoxDecoration(
                        color: hasText
                            ? colorScheme.primary
                            : colorScheme.primary.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: SvgPicture.asset(
                        Assets.icons.send.path,
                        width: 15.w,
                        height: 15.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
