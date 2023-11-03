import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/buttons/app_icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.needLeading = true,
    this.automaticallyImplyLeading = true,
    this.leading,
    this.actions = const <Widget>[],
    this.centerTitle,
    this.titleStyle,
    this.backgroundColor,
  });

  final String? title;
  final bool needLeading;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final List<Widget> actions;
  final bool? centerTitle;
  final TextStyle? titleStyle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: needLeading
          ? leading ??
              AppIconButton.back(
                onPressed: context.router.pop<void>,
                color: context.theme.iconTheme.color,
              )
          : null,
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title == null
          ? null
          : Text(
              title!,
              style: titleStyle ?? context.theme.textTheme.headlineMedium,
            ),
      backgroundColor: backgroundColor,
      actions: actions.isEmpty ? null : [...actions, SizedBox(width: 16.w)],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
