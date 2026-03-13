import 'package:flutter/material.dart';

import '../../../../generated/colors.gen.dart';

class GradientHeader extends StatelessWidget {
  final Color primary;
  final bool isDark;
  final double topPadding;
  const GradientHeader({
    super.key,
    required this.primary,
    required this.isDark,
    required this.topPadding,
  });

  @override
  Widget build(BuildContext context) {
    final gradientEnd = isDark
        ? const Color(0xFF1C1E2D)
        : Color.lerp(primary, ColorName.white, 0.18)!;
    return RepaintBoundary(
      child: Container(
        height: topPadding + 240,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [primary, gradientEnd],
          ),
        ),
        child: Stack(
          children: [
            // Decorative circle — top-left
            Positioned(
              top: -40,
              left: -40,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorName.white.withValues(alpha: 0.06),
                ),
              ),
            ),
            // Decorative circle — bottom-right
            Positioned(
              bottom: 10,
              right: -30,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorName.white.withValues(alpha: 0.07),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
