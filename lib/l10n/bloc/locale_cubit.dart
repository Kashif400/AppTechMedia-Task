import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/localization_service.dart';

class LocaleCubit extends Cubit<Locale> {
  final LocalizationService _localizationService;

  LocaleCubit(this._localizationService) : super(const Locale('en', 'US'));

  /// Load saved locale from storage
  Future<void> loadLocale() async {
    final saved = await _localizationService.getSavedLocale();
    emit(saved);
  }

  /// Change locale and save to storage
  Future<void> changeLocale(Locale locale) async {
    await _localizationService.setLocale(locale.languageCode);
    emit(locale);
  }

  /// Get localization service for accessing supported languages
  LocalizationService get localizationService => _localizationService;
}
