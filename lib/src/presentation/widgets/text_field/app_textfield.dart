import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.autofocus = false,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.inputFormatters = const [],
    this.needValidator = true,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.textInputAction,
    this.textStyle,
    this.validator,
    this.autovalidateMode,
    this.maxLines,
    this.maxLength = 500,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.counterText,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.onTapOutside,
  });

  final TextEditingController? controller;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;
  final bool needValidator;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? textStyle;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int maxLength;
  final String? labelText;
  final String? hintText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? counterText;

  final void Function(String? value)? onChanged;
  final void Function(String? value)? onSaved;
  final void Function(String? value)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(PointerDownEvent event)? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (labelText?.isNotEmpty ?? false) ...[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Text(
              labelText!,
              textAlign: TextAlign.left,
              style: context.theme.textTheme.displayMedium?.apply(
                color: context.theme.primaryColor,
              ),
            ),
          ),
        ],
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            TextFormField(
              controller: controller,
              enabled: enabled,
              readOnly: readOnly,
              autofocus: autofocus,
              validator: needValidator ? validator ?? nullValidator : null,
              autovalidateMode: autovalidateMode,
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              style: textStyle ?? context.theme.textTheme.bodySmall,
              cursorColor: context.theme.primaryColor,
              textInputAction: textInputAction,
              maxLength: maxLength,
              maxLines: maxLines,
              obscureText: obscureText,
              decoration: InputDecoration(
                enabled: enabled,
                hintText: hintText,
                hintStyle: (textStyle ?? context.theme.textTheme.bodySmall)?.apply(
                  color: context.theme.textTheme.bodyMedium?.color,
                ),
                counterText: counterText ?? '',
                counterStyle: context.theme.textTheme.bodySmall
                    ?.copyWith(color: context.theme.primaryColor),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 13.h,
                  horizontal: 16.w,
                ),
                prefix: prefix,
                suffix: suffix,
              ),
              onChanged: onChanged,
              onEditingComplete: onEditingComplete ?? FocusScope.of(context).nextFocus,
              onFieldSubmitted: onFieldSubmitted,
              onSaved: onSaved,
              onTap: onTap,
              onTapOutside: onTapOutside,
            ),
            if (prefixIcon != null)
              Align(
                alignment: Alignment.centerLeft,
                child: prefixIcon,
              ),
            if (suffixIcon != null)
              Align(
                alignment: Alignment.centerRight,
                child: suffixIcon,
              ),
          ],
        ),
      ],
    );
  }

  static String? nullValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return L10n.current.fillTheField;
    }
    return null;
  }
}
