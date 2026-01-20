import 'package:flutter/material.dart';
import '../utils/local_storage_service.dart';

class LocalizationService {
  final LocalStorageService _localStorageService;

  LocalizationService(this._localStorageService);

  Locale _currentLocale = const Locale('en', 'US');
  Locale get currentLocale => _currentLocale;

  // Supported locales with their display names
  final Map<String, Map<String, String>> _supportedLanguages = {
    'en': {
      'code': 'en',
      'name': 'English (US)',
      'languageCode': 'en',
      'countryCode': 'US',
    },
    'vi': {
      'code': 'vi',
      'name': 'Tiếng Việt',
      'languageCode': 'vi',
      'countryCode': 'VN',
    },
    'zh': {
      'code': 'zh',
      'name': '中文',
      'languageCode': 'zh',
      'countryCode': 'CN',
    },
    'es': {
      'code': 'es',
      'name': 'Español',
      'languageCode': 'es',
      'countryCode': '',
    },
  };

  List<Map<String, String>> get supportedLanguages =>
      _supportedLanguages.values.toList();

  Map<String, String>? get currentLanguage =>
      _supportedLanguages[_getLanguageCode(_currentLocale)];

  Future<void> initialize() async {
    // Load saved locale from storage, default to English (US) if nothing saved
    final savedLocale = _localStorageService.getLocale ?? 'en';
    print('📱 LocalizationService: Loading saved locale: $savedLocale');
    await setLocale(savedLocale);
  }

  Future<void> setLocale(String languageCode) async {
    final languageInfo = _supportedLanguages[languageCode];
    if (languageInfo != null) {
      final countryCode = languageInfo['countryCode']!;
      final locale = Locale(
        languageInfo['languageCode']!,
        countryCode.isNotEmpty ? countryCode : null,
      );

      _currentLocale = locale;
      print(
        '🌍 LocalizationService: Setting locale to $languageCode -> $locale',
      );

      // Save to local storage
      _localStorageService.setLocale = languageCode;
      print('💾 LocalizationService: Saved locale $languageCode to storage');
    } else {
      print(
        '❌ LocalizationService: Unsupported language code: $languageCode, falling back to en',
      );
      // Fallback to English if unsupported language code
      await setLocale('en');
    }
  }

  String _getLanguageCode(Locale locale) {
    // Return just the language code (e.g., 'en', 'vi', 'zh', 'es')
    return locale.languageCode;
  }

  bool isLanguageSupported(String languageCode) {
    return _supportedLanguages.containsKey(languageCode);
  }

  String getLanguageName(String languageCode) {
    final languageInfo = _supportedLanguages[languageCode];
    return languageInfo?['name'] ?? '';
  }

  /// Get saved locale
  Future<Locale> getSavedLocale() async {
    final savedLocale = _localStorageService.getLocale;
    if (savedLocale == null || savedLocale.toString().isEmpty) {
      return const Locale('en', 'US');
    }

    // Parse the saved locale string
    final languageCode = savedLocale.toString();
    final languageInfo = _supportedLanguages[languageCode];

    if (languageInfo != null) {
      final countryCode = languageInfo['countryCode']!;
      return Locale(
        languageInfo['languageCode']!,
        countryCode.isNotEmpty ? countryCode : null,
      );
    }

    return const Locale('en', 'US');
  }
}
