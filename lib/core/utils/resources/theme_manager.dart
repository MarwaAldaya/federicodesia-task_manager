import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';

import 'design_constants.dart';
import 'style_manager.dart';

ThemeData getLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorManager.lightScaffold,
    primaryColor: ColorManager.primary,
    cardColor: ColorManager.lightCard,
    dividerColor: ColorManager.lightDivider,
    hintColor: ColorManager.lightGrey,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorManager.primary,
      onPrimary: ColorManager.white,
      secondary: ColorManager.priorityMedium,
      onSecondary: ColorManager.black,
      tertiary: ColorManager.priorityHigh,
      onTertiary: ColorManager.white,
      surface: ColorManager.lightCard,
      onSurface: ColorManager.black,
      surfaceContainer: ColorManager.lightGrey,
      surfaceVariant: ColorManager.statusTodo,
      background: ColorManager.lightScaffold,
      onBackground: ColorManager.black,
      error: ColorManager.redError,
      onError: ColorManager.white,
      outline: ColorManager.lightDivider,
      inverseSurface: ColorManager.statusInProgress,
      onInverseSurface: ColorManager.white,
      inversePrimary: ColorManager.statusDone,
    ),
    textTheme: getLightTextTheme(),
    appBarTheme: AppBarTheme(
      color: ColorManager.white,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorManager.black),
      titleTextStyle:
          getSemiBoldStyle(color: ColorManager.black, fontSize: 18.sp),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        foregroundColor: ColorManager.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        textStyle: getMediumStyle(color: ColorManager.white, fontSize: 14.sp),
      ),
    ),
    cardTheme: CardTheme(
      color: ColorManager.lightCard,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
    dividerTheme: DividerThemeData(
      color: ColorManager.lightDivider,
      thickness: 1,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.white,
      hintStyle:
          getRegularStyle(color: ColorManager.lightGrey, fontSize: 13.sp),
      border: kOutlinedBorderPrimary,
      focusedBorder: kOutlinedBorderPrimary,
      enabledBorder: kOutlinedBorderBlack,
      errorBorder: kOutlinedBorderRed,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.primary,
      foregroundColor: ColorManager.white,
    ),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorManager.darkScaffold,
    primaryColor: ColorManager.primary,
    cardColor: ColorManager.darkCard,
    dividerColor: ColorManager.darkDivider,
    hintColor: ColorManager.darkGrey,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: ColorManager.primary,
      onPrimary: ColorManager.black,
      secondary: ColorManager.priorityMedium,
      onSecondary: ColorManager.white,
      tertiary: ColorManager.priorityHigh,
      onTertiary: ColorManager.white,
      surface: ColorManager.darkCard,
      onSurface: ColorManager.white,
      surfaceVariant: ColorManager.statusTodo,
      background: ColorManager.darkScaffold,
      onBackground: ColorManager.white,
      error: ColorManager.redError,
      onError: ColorManager.white,
      inverseSurface: ColorManager.statusInProgress,
      onInverseSurface: ColorManager.white,
      inversePrimary: ColorManager.statusDone,
    ),
    textTheme: getDarkTextTheme(),
    appBarTheme: AppBarTheme(
      color: ColorManager.darkCard,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorManager.white),
      titleTextStyle:
          getSemiBoldStyle(color: ColorManager.white, fontSize: 18.sp),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        foregroundColor: ColorManager.black,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        textStyle: getMediumStyle(color: ColorManager.black, fontSize: 14.sp),
      ),
    ),
    cardTheme: CardTheme(
      color: ColorManager.darkCard,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
    dividerTheme: DividerThemeData(
      color: ColorManager.darkDivider,
      thickness: 1,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.darkCard,
      hintStyle: getRegularStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
      border: kOutlinedBorderPrimary,
      focusedBorder: kOutlinedBorderPrimary,
      enabledBorder: kOutlinedBorderBlack,
      errorBorder: kOutlinedBorderRed,
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.primary,
      foregroundColor: ColorManager.black,
    ),
  );
}

TextTheme getLightTextTheme() {
  return TextTheme(
    displayLarge: getBoldStyle(color: ColorManager.white, fontSize: 28.sp),
    displayMedium: getMediumStyle(color: Colors.white, fontSize: 12.sp),
    displaySmall: getRegularStyle(color: ColorManager.white, fontSize: 12.sp),
    headlineLarge: getBoldStyle(color: ColorManager.lightGrey, fontSize: 24.sp),
    headlineMedium:
        getMediumStyle(color: ColorManager.lightGrey, fontSize: 20.sp),
    headlineSmall:
        getRegularStyle(color: ColorManager.lightGrey, fontSize: 16.sp),
    titleLarge: getBoldStyle(color: ColorManager.black, fontSize: 30.sp),
    titleMedium: getSemiBoldStyle(color: ColorManager.black, fontSize: 16.sp),
    titleSmall: getRegularStyle(color: ColorManager.black, fontSize: 14.sp),
    bodyLarge: getBoldStyle(color: ColorManager.primary, fontSize: 32.sp),
    bodyMedium: getMediumStyle(color: ColorManager.primary, fontSize: 17.sp),
    bodySmall: getRegularStyle(color: ColorManager.primary, fontSize: 15.sp),
    labelLarge: getMediumStyle(color: ColorManager.black, fontSize: 20.sp),
    labelMedium: getSemiBoldStyle(color: ColorManager.white, fontSize: 15.sp),
    labelSmall: getLightStyle(color: ColorManager.lightGrey, fontSize: 13.sp),
  );
}

TextTheme getDarkTextTheme() {
  return TextTheme(
    displayLarge: getBoldStyle(color: ColorManager.white, fontSize: 28.sp),
    displayMedium: getMediumStyle(color: ColorManager.white, fontSize: 12.sp),
    displaySmall: getRegularStyle(color: ColorManager.white, fontSize: 12.sp),
    headlineLarge: getBoldStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
    headlineMedium:
        getMediumStyle(color: ColorManager.darkGrey, fontSize: 24.sp),
    headlineSmall:
        getRegularStyle(color: ColorManager.darkGrey, fontSize: 16.sp),
    titleLarge: getBoldStyle(color: ColorManager.white, fontSize: 22.sp),
    titleMedium: getSemiBoldStyle(color: ColorManager.white, fontSize: 16.sp),
    titleSmall: getRegularStyle(color: ColorManager.white, fontSize: 14.sp),
    bodyLarge: getBoldStyle(color: ColorManager.primary, fontSize: 32.sp),
    bodyMedium: getMediumStyle(color: ColorManager.primary, fontSize: 17.sp),
    bodySmall: getRegularStyle(color: ColorManager.primary, fontSize: 15.sp),
    labelLarge: getMediumStyle(color: ColorManager.white, fontSize: 20.sp),
    labelMedium: getSemiBoldStyle(color: ColorManager.black, fontSize: 15.sp),
    labelSmall: getLightStyle(color: ColorManager.darkGrey, fontSize: 13.sp),
  );
}

getBoxShadow() {
  return [
    BoxShadow(blurRadius: 16, color: ColorManager.black.withOpacity(0.12))
  ];
}
