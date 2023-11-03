import 'package:flutter/cupertino.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textStyle,
    this.textAlign,
    this.padding = EdgeInsets.zero,
    this.buttonAlignment = Alignment.center,
  });
  final String text;
  final void Function()? onPressed;

  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final EdgeInsets padding;
  final Alignment buttonAlignment;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;
    return CupertinoButton(
      padding: padding,
      onPressed: onPressed,
      alignment: buttonAlignment,
      child: Text(
        text,
        textAlign: textAlign,
        style: textStyle ??
            context.theme.textTheme.bodyMedium?.copyWith(
              color: isDisabled ? context.theme.hintColor : null,
            ),
      ),
    );
  }
}
