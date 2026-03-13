import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/enum.dart';
import '../../../../generated/colors.gen.dart';
import '../bloc/chat_bloc.dart';
import 'message_bubble.dart';
import 'typing_indicator.dart';

class MessageList extends StatelessWidget {
  final ScrollController scrollController;

  const MessageList({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      buildWhen: (prev, curr) =>
          prev.messages != curr.messages ||
          prev.messagesStatus != curr.messagesStatus ||
          prev.selectedConversationId != curr.selectedConversationId ||
          prev.hasMoreMessages != curr.hasMoreMessages ||
          prev.sendMessageStatus != curr.sendMessageStatus,
      builder: (context, state) {
        if (state.selectedConversationId?.isEmpty == true &&
            state.messages.isEmpty) {
          return RepaintBoundary(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 72.sp,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  16.verticalSpace,
                  Text(
                    'Select a conversation from the menu\nor tap  +  to start a new one.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.outlineVariant,

                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.messagesStatus == Status.loading && state.messages.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.messagesStatus == Status.error && state.messages.isEmpty) {
          return RepaintBoundary(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(32.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error_outline, color: Colors.red, size: 48.sp),
                    10.verticalSpace,
                    Text(
                      state.errorMessage ?? 'Failed to load messages.',
                      textAlign: TextAlign.center,
                    ),
                    16.verticalSpace,
                    ElevatedButton.icon(
                      icon: Icon(
                        Icons.refresh,
                        size: 18.sp,
                        color: ColorName.white,
                      ),
                      label: Text(
                        'Retry',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                      onPressed: () => context.read<ChatBloc>().add(
                        FetchMessagesRequested(state.selectedConversationId!),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final messages = state.messages;
        final isTyping = state.sendMessageStatus == PostApiStatus.loading;
        // Extra slot at index 0 for the typing indicator so user messages are not displaced
        final extraTyping = isTyping ? 1 : 0;
        final itemCount =
            messages.length + extraTyping + (state.hasMoreMessages ? 1 : 0);

        return ListView.builder(
          controller: scrollController,
          reverse: true,
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            top: 8.h,
            bottom: 8.h,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            if (isTyping && index == 0) {
              return TypingIndicator();
            }

            final msgIndex = index - extraTyping;

            if (state.hasMoreMessages && msgIndex == messages.length) {
              return RepaintBoundary(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Center(
                    child: SizedBox(
                      width: 22.w,
                      height: 22.h,
                      child: CircularProgressIndicator(strokeWidth: 2.5),
                    ),
                  ),
                ),
              );
            }

            final message = messages[messages.length - 1 - msgIndex];
            // Skip the transient empty AI placeholder while the stream
            // hasn't started yet — the typing indicator covers that slot.
            if (message.role != 'user' &&
                (message.content?.isEmpty ?? true) &&
                isTyping) {
              return const SizedBox.shrink();
            }
            return MessageBubble(message: message);
          },
        );
      },
    );
  }
}
