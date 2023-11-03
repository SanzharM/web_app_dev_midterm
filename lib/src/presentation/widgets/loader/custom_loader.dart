import 'package:flutter/material.dart';
import 'package:web_app_dev_midterm/src/core/extensions/extensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(
          context.theme.primaryColor,
        ),
      ),
    );
  }
}
