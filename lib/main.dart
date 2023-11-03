import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_app_dev_midterm/src/application.dart';
import 'package:web_app_dev_midterm/src/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initialize();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
  ));

  const Widget app = Application();
  runApp(app);
}
