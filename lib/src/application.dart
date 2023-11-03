import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/app_router/app_router.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';
import 'package:web_app_dev_midterm/src/core/utils/utils.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/home/bloc/home_bloc.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/nav_bar/bloc/nav_bar_bloc.dart';
import 'package:web_app_dev_midterm/src/presentation/theme/app_theme.dart';
import 'package:web_app_dev_midterm/src/service_locator.dart';

import 'presentation/screens/settings/bloc/settings_bloc.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  static const String title = 'Tw0tter';

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final AppRouter _appRouter = sl<AppRouter>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          lazy: false,
          create: (_) => SettingsBloc()..initial(),
        ),
        BlocProvider<NavBarBloc>(
          create: (_) => NavBarBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                title: Application.title,
                debugShowCheckedModeBanner: false,

                // Routing
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),

                // Localization
                locale: state.locale,
                supportedLocales: L10n.supportedLocales,
                localizationsDelegates: L10n.delegates,

                // Theme
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: state.themeMode,
                themeAnimationCurve: Curves.easeInOut,
                themeAnimationDuration: Utils.animationDuration,
              );
            },
          );
        },
      ),
    );
  }
}
