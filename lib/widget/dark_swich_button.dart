import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/theme_cubit.dart';

class DarkSwichButton extends StatelessWidget {
  const DarkSwichButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final dark = themeMode == ThemeMode.dark;
        return GestureDetector(
          onTap: () => context.read<ThemeCubit>().toggleTheme(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: dark
                      ? Colors.white.withValues(alpha: 0.14)
                      : Colors.black.withValues(alpha: 0.12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.35),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (child, anim) => RotationTransition(
                        turns: Tween(begin: 0.7, end: 1.0).animate(
                          CurvedAnimation(parent: anim, curve: Curves.easeOut),
                        ),
                        child: FadeTransition(opacity: anim, child: child),
                      ),
                      child: Icon(
                        dark ? Icons.wb_sunny_rounded : Icons.dark_mode_rounded,
                        key: ValueKey(dark),
                        size: 16.sp,
                        color: dark ? const Color(0xFFFFD54F) : Colors.white,
                      ),
                    ),
                    const SizedBox(width: 7),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        dark ? 'Light' : 'Dark',
                        key: ValueKey(dark),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
