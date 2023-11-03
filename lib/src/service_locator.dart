import 'package:get_it/get_it.dart';
import 'package:web_app_dev_midterm/src/core/app_router/app_router.dart';
import 'package:web_app_dev_midterm/src/core/local_storage/local_storage.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  sl
    ..registerLazySingleton(() => AppRouter())
    ..registerLazySingleton(() => const LocalStorage());
}
