import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/loader/custom_loader.dart';

class CustomCell extends StatelessWidget {
  const CustomCell({
    super.key,
    this.title,
    this.leading,
    this.subtitle,
    this.icon,
    this.onPressed,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final String? title;
  final Widget? leading;
  final String? subtitle;
  final Widget? icon;
  final void Function()? onPressed;

  final CrossAxisAlignment crossAxisAlignment;

  factory CustomCell.leadingImage({
    String? title,
    String? imageUrl,
    String? subtitle,
    Widget? icon,
    void Function()? onPressed,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    Widget image = const ImageErrorBuilder();
    if (imageUrl?.isNotEmpty ?? false) {
      image = CachedNetworkImage(
        imageUrl: imageUrl!,
        height: 72.w,
        width: 72.w,
        placeholder: (_, __) => const CustomLoader(),
        errorWidget: (context, url, error) => const ImageErrorBuilder(),
      );
    }
    return CustomCell(
      leading: image,
      title: title,
      subtitle: subtitle,
      icon: icon,
      onPressed: onPressed,
      crossAxisAlignment: crossAxisAlignment,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          if (leading != null) ...[
            leading!,
            SizedBox(width: 16.w),
          ],
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  title ?? '',
                  textAlign: TextAlign.left,
                  style: context.theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle?.isNotEmpty ?? false) ...[
                  SizedBox(height: 8.h),
                  Text(
                    subtitle!,
                    textAlign: TextAlign.left,
                    style: context.theme.textTheme.bodySmall?.apply(
                      color: ColorName.darkGrey,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (icon != null) ...[
            SizedBox(width: 16.w),
            icon!,
          ],
        ],
      ),
    );
  }
}

class ImageErrorBuilder extends StatelessWidget {
  const ImageErrorBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.w,
      width: 72.w,
      child: const Icon(CupertinoIcons.exclamationmark_circle_fill),
    );
  }
}
