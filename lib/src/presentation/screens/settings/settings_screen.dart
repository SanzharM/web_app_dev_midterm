import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/application.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/core/flutter_gen/generated/assets.gen.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';
import 'package:web_app_dev_midterm/src/presentation/screens/settings/bloc/settings_bloc.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/buttons/app_button.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/buttons/app_icon_button.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/cell/custom_cell.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/language_mixin/language_mixin.dart';

class SettingsScreen extends StatelessWidget with LanguageMixin, CustomBottomSheetMixin {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            needLeading: false,
            automaticallyImplyLeading: false,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Divider(height: 0),
                SizedBox(height: 24.h),
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: state.themeMode.isDark
                        ? context.theme.textTheme.bodyMedium?.color
                        : null,
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  ),
                  child: Assets.icons.logoBlack.image(
                    height: 98.h,
                    width: 96.w,
                  ),
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
                SizedBox(height: 24.h),
                CustomCell(
                  leading: Icon(
                    CupertinoIcons.globe,
                    color: context.theme.primaryColor,
                  ),
                  title: L10n.of(context).appLanguage,
                  onPressed: () {
                    showLanguages(context);
                  },
                ),
                SizedBox(height: 12.h),
                CustomCell(
                  leading: Icon(
                    CupertinoIcons.color_filter,
                    color: context.theme.primaryColor,
                  ),
                  title: L10n.of(context).appTheme,
                  onPressed: () {
                    showThemeModes(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showThemeModes(BuildContext context) async {
    final ThemeMode currentThemeMode = context.read<SettingsBloc>().state.themeMode;
    return showCustomBottomSheet<void>(
      context: context,
      child: (_) => BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    L10n.of(context).appTheme,
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 24.h),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemCount: ThemeMode.values.length,
                    separatorBuilder: (_, __) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: const Divider(height: 0),
                    ),
                    itemBuilder: (_, i) {
                      final ThemeMode themeMode = ThemeMode.values[i];
                      bool isSelected = currentThemeMode == themeMode;
                      Color? color = isSelected
                          ? context.theme.primaryColor
                          : context.theme.textTheme.bodyMedium?.color;
                      return CustomCell(
                        leading: themeMode.icon(color: color),
                        title: themeMode.nameLocalized,
                        icon: isSelected
                            ? Icon(
                                CupertinoIcons.check_mark_circled_solid,
                                color: context.theme.colorScheme.primary,
                              )
                            : null,
                        onPressed: () {
                          context.read<SettingsBloc>().changeThemeMode(
                                themeMode,
                              );
                          context.router.pop<void>();
                        },
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  AppButton(
                    title: L10n.of(context).done,
                    onPressed: context.router.pop<void>,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
