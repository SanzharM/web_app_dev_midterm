import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/app_router/app_router.dart';
import 'package:web_app_dev_midterm/src/core/flutter_gen/generated/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 800),
      () => context.router.replaceAll([const NavBarRoute()]),
    );
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarHeight: 0.0,
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Assets.icons.logoBlack.image(
            alignment: Alignment.center,
            width: 96.w,
            height: 98.h,
          ),
        ),
      ),
    );
  }
}
