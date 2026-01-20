import 'package:clean_code_architecture_app/core/di/dependency_injection.dart';
import 'package:clean_code_architecture_app/core/services/localization_service.dart';
import 'package:clean_code_architecture_app/l10n/bloc/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/theme.dart';
import '../core/routes/app_router.dart';
import '../l10n/app_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppRouter>();
    final localizationService = locator<LocalizationService>();

    return BlocProvider(
      create: (context) => LocaleCubit(localizationService)..loadLocale(),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return ScreenUtilInit(
            designSize: const Size(375, 812), // iPhone 11 Pro design size
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: appRouter.router,
                // showPerformanceOverlay: true,
                theme: AppThemes().lightTheme,
                themeMode: ThemeMode.system,
                locale: locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
              );
            },
          );
        },
      ),
    );
  }
}
