import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/app_router/app_router.dart';
import 'package:web_app_dev_midterm/src/core/flutter_gen/generated/assets.gen.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/buttons/app_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          leading: AppIconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(CupertinoIcons.profile_circled),
            onPressed: () {
              // Open Drawer
            },
          ),
          centerTitle: true,
          title: Assets.icons.logoBlack.image(
            height: 42.h,
            fit: BoxFit.contain,
          ),
          actions: <Widget>[
            AppIconButton(
              icon: const Icon(CupertinoIcons.settings),
              onPressed: () {
                context.router.push<void>(const SettingsRoute());
              },
            ),
          ],
        ),
      ],
      body: ListView.builder(
        itemCount: 0,
        itemBuilder: (context, index) {
          return const SizedBox();
        },
      ),
    );
  }
}
