import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/flutter_gen/generated/colors.gen.dart';

class AppTheme {
  // static const String fontFamily = FontFamily.helvetica;

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: ColorName.black,
      scaffoldBackgroundColor: ColorName.white,
      hintColor: ColorName.darkGrey,
      colorScheme: const ColorScheme.light(
        primary: ColorName.black,
        error: ColorName.red,
        secondary: ColorName.secondaryGrey,
        background: ColorName.white,
      ),

      // Icon
      iconTheme: IconThemeData(color: ColorName.black, size: 24.w),

      // Text
      // fontFamily: FontFamily.helvetica,
      textTheme: getTextTheme(
        color: ColorName.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorName.white,
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: getTextTheme(color: ColorName.black).headlineMedium,
        iconTheme: IconThemeData(color: ColorName.white, size: 24.w),
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        primaryColor: ColorName.black,
        scaffoldBackgroundColor: ColorName.white,
        textTheme: CupertinoTextThemeData(
          primaryColor: ColorName.white,
          textStyle: getTextTheme(color: ColorName.white).bodyLarge,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ColorName.black,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: ColorName.white,
      scaffoldBackgroundColor: ColorName.black,
      hintColor: ColorName.darkGrey,
      colorScheme: const ColorScheme.light(
        primary: ColorName.black,
        error: ColorName.red,
        secondary: ColorName.secondaryGrey,
        background: ColorName.white,
      ),

      // Icon
      iconTheme: IconThemeData(color: ColorName.white, size: 24.w),

      // Text
      // fontFamily: FontFamily.helvetica,
      textTheme: getTextTheme(
        color: ColorName.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorName.black,
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: getTextTheme(color: ColorName.white).headlineMedium,
        iconTheme: IconThemeData(color: ColorName.white, size: 24.w),
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        primaryColor: ColorName.white,
        scaffoldBackgroundColor: ColorName.black,
        textTheme: CupertinoTextThemeData(
          primaryColor: ColorName.white,
          textStyle: getTextTheme(color: ColorName.white).bodyLarge,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ColorName.white,
      ),
    );
  }

  static const TextStyle _primaryStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    // fontFamily: fontFamily,
  );
  static TextTheme getTextTheme({Color? color}) => TextTheme(
        // Headlines
        headlineLarge: _primaryStyle.copyWith(
          fontSize: 24.0.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        headlineMedium: _primaryStyle.copyWith(
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        // headlineSmall:

        // Subtitles
        // titleLarge:
        titleMedium: _primaryStyle.copyWith(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        titleSmall: _primaryStyle.copyWith(
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),

        // Body
        bodyLarge: _primaryStyle.copyWith(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        bodyMedium: _primaryStyle.copyWith(
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        bodySmall: _primaryStyle.copyWith(
          fontSize: 12.0.sp,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      );
}
