import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_code_architecture_app/generated/colors.gen.dart';
import 'package:clean_code_architecture_app/l10n/bloc/locale_cubit.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, currentLocale) {
        final localeCubit = context.read<LocaleCubit>();
        final localizationService = localeCubit.localizationService;

        // Get current language or fallback to English
        final currentLanguage =
            localizationService.currentLanguage ??
            {
              'code': 'en',
              'name': 'English (US)',
              'languageCode': 'en',
              'countryCode': 'US',
            };

        return PopupMenuButton<String>(
          onSelected: (String languageCode) {
            final locale = _getLocaleFromString(languageCode);
            localeCubit.changeLocale(locale);
          },
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _getLanguageFlag(currentLanguage['code']!),
              const SizedBox(width: 8),
              // Display the current language name
              Text(
                currentLanguage['name']!,
                style: TextStyle(fontSize: 12, color: ColorName.textPrimary),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: ColorName.textPrimary,
              ),
            ],
          ),
          color: ColorName.background,
          itemBuilder: (BuildContext context) {
            return localizationService.supportedLanguages.map((language) {
              final isSelected = currentLanguage['code'] == language['code'];
              return PopupMenuItem<String>(
                value: language['code']!,
                child: Row(
                  children: [
                    _getLanguageFlag(language['code']!),
                    const SizedBox(width: 12),
                    Text(
                      language['name']!,
                      style: TextStyle(
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                        color: isSelected
                            ? ColorName.primary
                            : ColorName.textPrimary,
                      ),
                    ),
                    if (isSelected)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(Icons.check, color: ColorName.primary),
                      ),
                  ],
                ),
              );
            }).toList();
          },
        );
      },
    );
  }

  Widget _getLanguageFlag(String languageCode) {
    switch (languageCode) {
      case 'en':
        return const Text('🇺🇸', style: TextStyle(fontSize: 20));
      case 'vi':
        return const Text('🇻🇳', style: TextStyle(fontSize: 20));
      case 'zh':
        return const Text('🇨🇳', style: TextStyle(fontSize: 20));
      case 'es':
        return const Text('🇪🇸', style: TextStyle(fontSize: 20));
      default:
        return const Icon(Icons.language);
    }
  }

  Locale _getLocaleFromString(String localeString) {
    switch (localeString) {
      case 'en':
        return const Locale('en', 'US');
      case 'vi':
        return const Locale('vi', 'VN');
      case 'zh':
        return const Locale('zh', 'CN');
      case 'es':
        return const Locale('es');
      default:
        return const Locale('en', 'US');
    }
  }
}
