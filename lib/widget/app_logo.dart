import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final Color primary;
  const AppLogo({super.key, required this.size, required this.primary});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.5),
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          'R',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: size * 0.46,
          ),
        ),
      ),
    );
  }
}
