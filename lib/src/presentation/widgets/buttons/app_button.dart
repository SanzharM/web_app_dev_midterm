import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/core/flutter_gen/generated/colors.gen.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.prefixIcon,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.backgroundColor,
    this.color,
    this.borderColor,
    this.titleStyle,
    this.padding,
    this.height,
    this.isLoading = false,
    this.onPressed,
    this.needBorder = false,
  });

  final String title;
  final Widget Function(Color iconColor)? prefixIcon;
  final MainAxisAlignment mainAxisAlignment;
  final Color? backgroundColor;
  final Color? color;
  final Color? borderColor;
  final bool needBorder;
  final TextStyle? titleStyle;

  /// Default is EdgeInsets.all(8.w)
  final EdgeInsets? padding;

  /// If null -> 44.h
  final double? height;

  final bool isLoading;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Color newBackgroundColor = backgroundColor ?? context.theme.primaryColor;
    Color newValueColor = color ?? context.theme.scaffoldBackgroundColor;
    if (onPressed == null) {
      newBackgroundColor = ColorName.lightGrey;
      newValueColor = ColorName.darkGrey;
    }
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: height ?? 48.h,
        width: double.maxFinite,
        constraints: const BoxConstraints(minHeight: 32.0),
        padding: padding ?? EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          border: needBorder
              ? Border.all(
                  color: borderColor ?? context.theme.primaryColor,
                  width: 1.0,
                )
              : null,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: newBackgroundColor,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isLoading
              ? CupertinoActivityIndicator(
                  color: newValueColor,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: mainAxisAlignment,
                  children: [
                    if (prefixIcon != null) ...[
                      prefixIcon!(newValueColor),
                      SizedBox(width: 8.w),
                    ],
                    Flexible(
                      child: Text(
                        title,
                        style: titleStyle ??
                            context.theme.textTheme.titleMedium?.apply(
                              color: newValueColor,
                            ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
