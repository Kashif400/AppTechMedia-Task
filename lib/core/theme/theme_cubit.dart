import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/local_storage_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final LocalStorageService _localStorage;

  ThemeCubit(this._localStorage) : super(ThemeMode.dark);

  /// Load persisted theme on startup
  void loadTheme() {
    final saved = _localStorage.themeMode;
    emit(_fromString(saved));
  }

  /// Toggle between light and dark, and persist the choice
  void toggleTheme() {
    final next = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    _localStorage.themeMode = _toString(next);
    emit(next);
  }

  /// Set an explicit theme mode
  void setTheme(ThemeMode mode) {
    _localStorage.themeMode = _toString(mode);
    emit(mode);
  }

  bool get isDark => state == ThemeMode.dark;

  // ── helpers ──────────────────────────────────────────
  static String _toString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  static ThemeMode _fromString(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.dark;
    }
  }
}
