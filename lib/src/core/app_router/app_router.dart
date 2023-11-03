import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/nav_bar/nav_bar_screen.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/profile/profile_screen.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/settings/settings_screen.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/splash/splash_screen.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: NavBarScreen),
    CustomRoute(
      page: SettingsScreen,
      transitionsBuilder: TransitionsBuilders.slideBottom,
    ),
    AutoRoute(page: ProfileScreen),
  ],
)
class AppRouter extends _$AppRouter {}
