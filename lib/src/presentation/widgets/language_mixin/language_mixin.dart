import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/settings/bloc/settings_bloc.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/bottom_sheet/bottom_sheet_tag.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/buttons/app_button.dart';

mixin LanguageMixin {
  Future<void> showLanguages(BuildContext context) async {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      elevation: 0,
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: true,
      showDragHandle: false,
      constraints: BoxConstraints(
        minWidth: context.mediaQuery.size.height * 0.3,
        maxHeight: context.mediaQuery.size.height * 0.87,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      builder: (_) => BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) => SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: const BottomSheetTag(),
                ),
                Text(
                  L10n.of(context).appLanguage,
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16.h),
                Flexible(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    itemCount: L10n.supportedLocales.length,
                    separatorBuilder: (_, __) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: const Divider(height: 0),
                    ),
                    itemBuilder: (_, i) {
                      final locale = L10n.supportedLocales.elementAt(i);

                      return CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          context.read<SettingsBloc>().changeLocale(
                                locale,
                              );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                locale.languageName,
                                textAlign: TextAlign.left,
                                style: context.theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            if (locale == state.locale) ...[
                              SizedBox(width: 8.w),
                              Icon(
                                CupertinoIcons.check_mark_circled_solid,
                                color: context.theme.colorScheme.primary,
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                AppButton(
                  title: L10n.of(context).done,
                  onPressed: context.router.pop<void>,
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
