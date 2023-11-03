import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';

extension XBuildContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  NavigatorState get navigator => Navigator.of(this);

  // StackRouter get router => AutoRouter.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => MediaQuery.sizeOf(this);

  FocusScopeNode get focus => FocusScope.of(this);

  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: theme.textTheme.bodyMedium?.color?.withOpacity(0.85),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 2000),
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.all(16.w),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        // content: CustomSnackbar(message: message),
        content: Text(message),
      ),
    );
  }
}

extension XLocale on Locale {
  String get languageName {
    switch (languageCode) {
      case 'ru':
        return L10n.current.russian;
      case 'en':
        return L10n.current.english;
      default:
        return languageCode;
    }
  }
}

extension XThemeMode on ThemeMode {
  bool get isSystem => this == ThemeMode.system;
  bool get isLight => this == ThemeMode.light;
  bool get isDark => this == ThemeMode.dark;

  String get nameLocalized {
    switch (this) {
      case ThemeMode.system:
        return L10n.current.systemTheme;
      case ThemeMode.light:
        return L10n.current.lightTheme;
      case ThemeMode.dark:
        return L10n.current.darkTheme;
    }
  }

  Widget icon({Color? color}) {
    switch (this) {
      case ThemeMode.system:
        return Icon(
          CupertinoIcons.device_phone_portrait,
          color: color,
        );
      case ThemeMode.light:
        return Icon(
          CupertinoIcons.sun_max_fill,
          color: color,
        );
      case ThemeMode.dark:
        return Icon(
          CupertinoIcons.moon_stars_fill,
          color: color,
        );
    }
  }
}
