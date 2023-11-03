import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';
import 'package:web_app_dev_midterm/src/presentation/widgets/bottom_sheet/bottom_sheet_tag.dart';

export 'package:web_app_dev_midterm/src/presentation/widgets/bottom_sheet/bottom_sheet_tag.dart';

mixin CustomBottomSheetMixin {
  Future<T?> showCustomBottomSheet<T>({
    required BuildContext context,
    required Widget Function(BuildContext) child,
    bool isDismissable = true,
    bool isDragable = true,
    bool isGrowable = true,
    bool useSafeArea = false,
  }) async {
    return await showModalBottomSheet<T>(
      context: context,
      isDismissible: true,
      isScrollControlled: isGrowable,
      constraints: BoxConstraints(
        minWidth: context.mediaQuery.size.height * 0.3,
        maxHeight: context.mediaQuery.size.height * 0.87,
      ),
      enableDrag: isDragable,
      elevation: 0,
      useSafeArea: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: const BottomSheetTag(),
          ),
          Flexible(
            child: child(_),
          ),
        ],
      ),
    );
  }
}
