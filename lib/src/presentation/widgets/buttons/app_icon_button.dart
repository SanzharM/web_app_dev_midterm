import 'package:flutter/cupertino.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.padding,
  });

  final Widget icon;
  final void Function()? onPressed;
  final EdgeInsets? padding;

  factory AppIconButton.back({Color? color, void Function()? onPressed}) {
    return AppIconButton(
      icon: Icon(CupertinoIcons.left_chevron, color: color),
      onPressed: onPressed ?? () {},
    );
  }
  factory AppIconButton.close({Color? color, void Function()? onPressed}) {
    return AppIconButton(
      icon: Icon(CupertinoIcons.xmark, color: color),
      onPressed: onPressed ?? () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: padding ?? EdgeInsets.zero,
      onPressed: onPressed,
      child: icon,
    );
  }
}
