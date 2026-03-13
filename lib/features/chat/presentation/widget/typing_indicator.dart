import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// An animated "three bouncing dots" typing indicator styled as an AI
/// message bubble.
class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with TickerProviderStateMixin {
  static const int _dotCount = 3;
  static const Duration _dotPeriod = Duration(milliseconds: 1200);
  static const Duration _dotDelay = Duration(milliseconds: 200);

  final List<AnimationController> _controllers = [];
  final List<Animation<double>> _animations = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _dotCount; i++) {
      final controller = AnimationController(vsync: this, duration: _dotPeriod);

      final animation = TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween(
            begin: 0.0,
            end: -6.0,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 25,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: -6.0,
            end: 0.0,
          ).chain(CurveTween(curve: Curves.easeIn)),
          weight: 25,
        ),
        TweenSequenceItem(tween: ConstantTween(0.0), weight: 50),
      ]).animate(controller);

      _controllers.add(controller);
      _animations.add(animation);

      // Stagger each dot's start
      Future.delayed(_dotDelay * i, () {
        if (mounted) controller.repeat();
      });
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RepaintBoundary(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(top: 3, bottom: 3, right: 64.w),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(18),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(_dotCount, (i) {
              return AnimatedBuilder(
                animation: _animations[i],
                builder: (_, __) => Transform.translate(
                  offset: Offset(0, _animations[i].value),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    width: 7.w,
                    height: 7.w,
                    decoration: BoxDecoration(
                      color: colorScheme.onSurface.withValues(alpha: 0.55),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
