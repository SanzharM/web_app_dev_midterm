import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/application.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/core/flutter_gen/generated/assets.gen.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/buttons/app_icon_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        needLeading: false,
        title: L10n.of(context).settings,
        actions: [
          AppIconButton.close(
            onPressed: context.router.pop<void>,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Divider(height: 0),
            SizedBox(height: 24.h),
            Assets.icons.logoBlack.image(
              height: 98.h,
              width: 96.w,
            ),
            SizedBox(height: 24.h),
            Center(
              child: Text(
                '${Application.title} 1.0.0',
                textAlign: TextAlign.center,
                style: context.theme.textTheme.titleMedium,
              ),
            ),
            SizedBox(height: 24.h),
            const Divider(height: 0),
            AppIconButton(
              icon: Icon(CupertinoIcons.globe),
              onPressed: () {},
            ),
            SizedBox(height: 12.h),
            AppIconButton(
              icon: Icon(CupertinoIcons.color_filter),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
