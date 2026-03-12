import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/constants/enum.dart';
import '../../../../generated/colors.gen.dart';
import '../bloc/chat_bloc.dart';
import 'message_bubble.dart';

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
        if (state.selectedConversationId == null && state.messages.isEmpty) {
          return Center(
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
          );
        }

        if (state.messagesStatus == Status.loading && state.messages.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.messagesStatus == Status.error && state.messages.isEmpty) {
          return Center(
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
          );
        }

        final messages = state.messages;
        final itemCount = messages.length + (state.hasMoreMessages ? 1 : 0);
        final isTyping = state.sendMessageStatus == PostApiStatus.loading;

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
            if (state.hasMoreMessages && index == messages.length) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Center(
                  child: SizedBox(
                    width: 22.w,
                    height: 22.h,
                    child: CircularProgressIndicator(strokeWidth: 2.5),
                  ),
                ),
              );
            }

            if (isTyping && index == 0) {
              return _buildLeftLoadingIndicator(context);
            }
            final message = messages[messages.length - 1 - index];
            return MessageBubble(message: message);
          },
        );
      },
    );
  }

  Widget _buildLeftLoadingIndicator(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Loading Indicator
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: SpinKitThreeBounce(
            color: isDark ? Colors.white : Colors.black,
            size: 13.sp,
          ),
        ),
      ],
    );
  }
}
