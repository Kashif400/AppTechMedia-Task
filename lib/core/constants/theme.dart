import 'package:clean_code_architecture_app/generated/assets.gen.dart';
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
        fontFamily: FontFamily.roboto,
        color: ColorName.textfieldLabel,
      ),
      hintStyle: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.roboto,
        color: ColorName.textfieldLabel,
      ),
      helperStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.roboto,
        color: ColorName.textfieldLabel,
      ),
      errorStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.roboto,
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
      error: ColorName.primary,
      brightness: Brightness.light,
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
            fontFamily: FontFamily.sourceSansPro,
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
          fontFamily: FontFamily.sourceSansPro,
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
        fontFamily: FontFamily.roboto,
        color: ColorName.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.roboto,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.roboto,
      ),
      titleLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.roboto,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.roboto,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.roboto,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.roboto,
        color: ColorName.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.roboto,
      ),
      bodySmall: TextStyle(
        fontSize: 8.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.roboto,
      ),
      labelLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.roboto,
        color: const Color(0xff737373),
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.roboto,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        fontFamily: FontFamily.roboto,
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
}

final OutlineInputBorder outlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.r),
  borderSide: BorderSide(color: ColorName.black.withOpacity(0.5), width: 1),
);
