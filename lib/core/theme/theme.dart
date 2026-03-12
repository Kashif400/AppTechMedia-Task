import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/colors.gen.dart';
import '../../generated/fonts.gen.dart';

class AppThemes {
  ///LIGHT THEME
  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorName.background,
    primaryColorLight: ColorName.primary,
    primaryColorDark: ColorName.primary,
    primaryColor: ColorName.primary,
    secondaryHeaderColor: ColorName.onSecondary,

    useMaterial3: true,

    // which thing shout be white

    ///
    // fontFamily: "inter",
    cardColor: ColorName.white,
    hintColor: ColorName.white,
    canvasColor: ColorName.white,
    focusColor: ColorName.white,
    hoverColor: ColorName.white,
    splashColor: ColorName.black.withOpacity(0.2),
    highlightColor: ColorName.white,
    shadowColor: ColorName.black.withOpacity(0.3),

    dividerTheme: DividerThemeData(
      color: ColorName.black.withOpacity(0.3),
      space: 0,
      thickness: 1,
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(ColorName.black.withOpacity(0.1)),
      trackColor: WidgetStateProperty.all(ColorName.primary),
      trackOutlineColor: WidgetStateProperty.all(
        ColorName.black.withOpacity(0.4),
      ),
    ),

    radioTheme: RadioThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorName.primary; // Selected state color
        }
        return ColorName.onSecondary; // Unselected state color
      }),
    ),

    // brightness: Brightness.light,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: ColorName.primary,
    ),
    dividerColor: ColorName.black.withOpacity(0.3),
    disabledColor: ColorName.primary,

    visualDensity: VisualDensity.adaptivePlatformDensity,

    ///TEXT FIELD THEME
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorName.textfieldFilled,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: ColorName.textfieldLabel,
      ),
      hintStyle: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: ColorName.textfieldLabel,
      ),
      helperStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: ColorName.textfieldLabel,
      ),
      errorStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: ColorName.danger,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: ColorName.textfieldBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: ColorName.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: ColorName.danger),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: ColorName.textfieldBorder),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: ColorName.textfieldBorder.withOpacity(0.5),
        ),
      ),
    ),

    ///COLOR SCHEME
    colorScheme: const ColorScheme.light(
      // #F1F2F4, rgba(241, 242, 244, 1)
      surface: Color.fromRGBO(241, 242, 244, 1),
      primary: ColorName.primaryLightTheme,
      onPrimary: ColorName.white,
      error: ColorName.primary,
      brightness: Brightness.light,
      surfaceContainerHighest: Color(0xFFE5E7EB),
    ),

    ///FLOATING ACTION BUTTON THEME
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorName.primary,
      foregroundColor: ColorName.white,
    ),

    /// ELEVATED BUTTON THEME
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          TextStyle(
            fontSize: 20.sp,
            color: ColorName.white,
            fontWeight: FontWeight.normal,
            fontFamily: FontFamily.montserrat,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(ColorName.primary),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      ),
    ),

    // outlined button
    /// ELEVATED BUTTON THEME
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorName.primary,
        side: BorderSide(color: ColorName.primary),
        iconColor: ColorName.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        textStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorName.primary,
          fontWeight: FontWeight.normal,
          fontFamily: FontFamily.montserrat,
        ),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: ColorName.background,
      surfaceTintColor: ColorName.warningLight,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Make the status bar transparent
        statusBarBrightness: Brightness.dark, // For iOS
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(color: ColorName.primary),
      titleTextStyle: TextStyle(
        color: ColorName.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),

    ///DIALOG THEME
    // dialogTheme: const DialogTheme(
    //   backgroundColor: kcWhiteColor,
    //   iconColor: kcPrimaryColor,
    //   shadowColor: kcGreyColor,
    //   contentTextStyle: TextStyle(
    //     color: kcSolidBlackColor,
    //     fontSize: 16,
    //     fontWeight: FontWeight.w400,
    //
    //   ),
    //   titleTextStyle: TextStyle(
    //     color: kcSolidBlackColor,
    //     fontSize: 20,
    //     fontWeight: FontWeight.w600,
    //
    //   ),
    // ),

    ///TEXT THEME
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.montserrat,
        color: ColorName.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.montserrat,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
      ),
      titleLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: ColorName.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
      ),
      bodySmall: TextStyle(
        fontSize: 8.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
      ),
      labelLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: const Color(0xff737373),
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.montserrat,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
      ),
    ),

    ///CARD THEME
    cardTheme: CardThemeData(
      color: ColorName.primary,
      margin: EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
    ),

    ///SNACKBAR THEME
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: ColorName.primary,
      closeIconColor: ColorName.background,
      behavior: SnackBarBehavior.floating,
    ),

    ///BUTTON THEME
    buttonTheme: ButtonThemeData(
      buttonColor: ColorName.primary,
      focusColor: ColorName.black.withOpacity(0.5),
      disabledColor: ColorName.black.withOpacity(0.5),
      splashColor: ColorName.black.withOpacity(0.5),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: ColorName.primary,
        onPrimary: ColorName.primary,
        secondary: ColorName.primary,
        onSecondary: ColorName.primary,
        error: ColorName.primary,
        onError: ColorName.primary,
        onSurface: ColorName.primary,
        surface: ColorName.primary,
      ),
      padding: EdgeInsets.all(8.h),
      height: 40.h,
      minWidth: 200.w,
    ),
    dialogTheme: DialogThemeData(backgroundColor: ColorName.white),
    tabBarTheme: TabBarThemeData(indicatorColor: ColorName.primary),
  );

  // ─────────────────────────────────────────────
  /// DARK THEME  (matches Rehab AI dark-mode design)
  // ─────────────────────────────────────────────
  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF1C1E2D),
    primaryColorLight: ColorName.primary,
    primaryColorDark: ColorName.primary,
    primaryColor: ColorName.primary,
    secondaryHeaderColor: const Color(0xFF2A2D40),

    useMaterial3: true,

    cardColor: const Color(0xFF252838),
    hintColor: const Color(0xFF252838),
    canvasColor: const Color(0xFF1C1E2D),
    focusColor: const Color(0xFF252838),
    hoverColor: const Color(0xFF252838),
    splashColor: Colors.white.withOpacity(0.1),
    highlightColor: const Color(0xFF252838),
    shadowColor: Colors.black.withOpacity(0.5),

    dividerTheme: DividerThemeData(
      color: Colors.white.withOpacity(0.12),
      space: 0,
      thickness: 1,
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(Colors.white.withOpacity(0.8)),
      trackColor: WidgetStateProperty.all(ColorName.primary),
      trackOutlineColor: WidgetStateProperty.all(Colors.white.withOpacity(0.3)),
    ),

    radioTheme: RadioThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorName.primary;
        }
        return const Color(0xFF8B8FA8);
      }),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: ColorName.primary,
    ),
    dividerColor: Colors.white.withOpacity(0.12),
    disabledColor: const Color(0xFF4A4D60),

    visualDensity: VisualDensity.adaptivePlatformDensity,

    /// TEXT FIELD THEME
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xFF252838),
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: const Color(0xFF8B8FA8),
      ),
      hintStyle: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: const Color(0xFF8B8FA8),
      ),
      helperStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: const Color(0xFF8B8FA8),
      ),
      errorStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: ColorName.danger,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: Color(0xFF3A3D52)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: ColorName.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: ColorName.danger),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: Color(0xFF3A3D52)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: ColorName.danger),
      ),
    ),

    /// COLOR SCHEME
    colorScheme: const ColorScheme.dark(
      surface: Color(0xFF1C1E2D),
      primary: ColorName.primary,
      onPrimary: Colors.white,
      secondary: Color(0xFF2A2D40),
      onSecondary: Colors.white,
      error: ColorName.danger,
      onError: Colors.white,
      onSurface: Colors.white,
      brightness: Brightness.dark,
      surfaceContainerHighest: Color(0xFF2A2A2A),
    ),

    /// FLOATING ACTION BUTTON THEME
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorName.primary,
      foregroundColor: Colors.white,
    ),

    /// ELEVATED BUTTON THEME
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          TextStyle(
            fontSize: 20.sp,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontFamily: FontFamily.montserrat,
          ),
        ),
        backgroundColor: WidgetStateProperty.all(ColorName.primary),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        ),
      ),
    ),

    /// OUTLINED BUTTON THEME
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ColorName.primary,
        side: const BorderSide(color: ColorName.primary),
        iconColor: ColorName.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        textStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorName.primary,
          fontWeight: FontWeight.normal,
          fontFamily: FontFamily.montserrat,
        ),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1C1E2D),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),

    /// TEXT THEME
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.montserrat,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.montserrat,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: const Color(0xFFE2E4EF),
      ),
      bodyMedium: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: const Color(0xFFE2E4EF),
      ),
      bodySmall: TextStyle(
        fontSize: 8.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: const Color(0xFF8B8FA8),
      ),
      labelLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: const Color(0xFF8B8FA8),
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.montserrat,
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.montserrat,
        color: const Color(0xFF8B8FA8),
      ),
    ),

    /// CARD THEME
    cardTheme: CardThemeData(
      color: const Color(0xFF252838),
      margin: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
    ),

    /// SNACKBAR THEME
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF252838),
      contentTextStyle: TextStyle(color: Colors.white),
      closeIconColor: Colors.white,
      behavior: SnackBarBehavior.floating,
    ),

    /// BUTTON THEME
    buttonTheme: ButtonThemeData(
      buttonColor: ColorName.primary,
      focusColor: Colors.white.withOpacity(0.5),
      disabledColor: const Color(0xFF4A4D60),
      splashColor: Colors.white.withOpacity(0.1),
      colorScheme: const ColorScheme.dark(
        primary: ColorName.primary,
        secondary: Color(0xFF2A2D40),
        error: ColorName.danger,
        surface: Color(0xFF252838),
      ),
      padding: EdgeInsets.all(8.h),
      height: 40.h,
      minWidth: 200.w,
    ),
    dialogTheme: const DialogThemeData(backgroundColor: Color(0xFF252838)),
    tabBarTheme: const TabBarThemeData(indicatorColor: ColorName.primary),
  );
}

final OutlineInputBorder outlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.r),
  borderSide: BorderSide(color: ColorName.black.withOpacity(0.5), width: 1),
);
