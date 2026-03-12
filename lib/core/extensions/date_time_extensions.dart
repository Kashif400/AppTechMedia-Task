import 'package:flutter/material.dart';

extension NullableStringDateExtension on String? {
  /// Returns a human-readable relative time string (e.g. "2s ago", "3h ago").
  String toRelativeTime() {
    final dateStr = this;
    if (dateStr == null || dateStr.isEmpty) return '';
    try {
      final date = DateTime.parse(dateStr).toLocal();
      final diff = DateTime.now().difference(date);
      if (diff.inSeconds < 60) return '${diff.inSeconds} s ago';
      if (diff.inMinutes < 60) return '${diff.inMinutes} m ago';
      if (diff.inHours < 24) return '${diff.inHours} h ago';
      if (diff.inDays < 7) return '${diff.inDays} d ago';
      if (diff.inDays < 30) return '${(diff.inDays / 7).floor()} w ago';
      if (diff.inDays < 365) return '${(diff.inDays / 30).floor()} mo ago';
      return '${(diff.inDays / 365).floor()} y ago';
    } catch (_) {
      return '';
    }
  }
}

extension StringAvatarExtension on String? {
  static const _palette = [
    Color(0xFF6366F1),
    Color(0xFF8B5CF6),
    Color(0xFF06B6D4),
    Color(0xFF10B981),
    Color(0xFFF59E0B),
    Color(0xFFEF4444),
    Color(0xFFEC4899),
    Color(0xFF3B82F6),
  ];

  /// Returns a deterministic avatar color based on the first character.
  Color toAvatarColor() {
    final s = this;
    if (s == null || s.isEmpty) return _palette[0];
    return _palette[s.codeUnitAt(0) % _palette.length];
  }
}
