import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/buttons/app_button.dart';

mixin CustomDialogMixin {
  Future<T?> showCustomDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    bool useSafeArea = true,
    required Widget child,
  }) async {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
      builder: (_) => Center(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  Future<T?> showDecisionDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    bool useSafeArea = true,
    String? title,
    required String text,
    void Function()? onNo,
    void Function()? onYes,
  }) async {
    return showCustomDialog<T>(
      context: context,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (title?.isNotEmpty ?? true) ...[
              Text(
                title!,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.titleMedium,
              ),
              SizedBox(height: 16.h),
            ],
            Text(
              text,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.bodyMedium,
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: AppButton(
                    title: L10n.of(context).no,
                    backgroundColor: ColorName.transparent,
                    needBorder: true,
                    borderColor: context.theme.primaryColor,
                    color: context.theme.primaryColor,
                    onPressed: onNo ?? context.router.pop<void>,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: AppButton(
                    title: L10n.of(context).yes,
                    onPressed: onYes,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
