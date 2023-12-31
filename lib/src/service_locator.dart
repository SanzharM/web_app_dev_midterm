import 'package:get_it/get_it.dart';
import 'package:web_app_dev_midterm/src/core/app_router/app_router.dart';
import 'package:web_app_dev_midterm/src/core/local_storage/local_storage.dart';
import 'package:web_app_dev_midterm/src/data/datasources/post_datasource.dart';
import 'package:web_app_dev_midterm/src/data/datasources/user_datasource.dart';
import 'package:web_app_dev_midterm/src/data/repositories_impl/post_repository_impl.dart';
import 'package:web_app_dev_midterm/src/data/repositories_impl/user_repository_impl.dart';
import 'package:web_app_dev_midterm/src/domain/repository/post_repository.dart';
import 'package:web_app_dev_midterm/src/domain/repository/user_repository.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/comment/add_comment_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/comment/delete_comment_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/add_post_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/delete_post_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/get_post_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/get_posts_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/user/edit_user_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/user/get_user_usecase.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  sl
    ..registerLazySingleton(() => AppRouter())
    ..registerLazySingleton(() => const LocalStorage())

    // Repos impl
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(sl()),
    )
    ..registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(sl()),
    )

    // Datasources
    ..registerLazySingleton<UserDatasource>(
      () => UserDatasourceImpl(),
    )
    ..registerLazySingleton<PostDatasource>(
      () => PostDatasourceImpl(),
    )

    // UseCases

    // User
    ..registerLazySingleton<GetUserUseCase>(
      () => GetUserUseCase(sl()),
    )
    ..registerLazySingleton<EditUserUseCase>(
      () => EditUserUseCase(sl()),
    )

    // POST
    ..registerLazySingleton<GetPostUseCase>(
      () => GetPostUseCase(sl()),
    )
    ..registerLazySingleton<GetPostsUseCase>(
      () => GetPostsUseCase(sl()),
    )

    // CRUD Post
    ..registerLazySingleton<AddPostUseCase>(
      () => AddPostUseCase(sl()),
    )
    ..registerLazySingleton<DeletePostUseCase>(
      () => DeletePostUseCase(sl()),
    )

    // CRUD Comment
    ..registerLazySingleton<AddCommentUseCase>(
      () => AddCommentUseCase(sl()),
    )
    ..registerLazySingleton<DeleteCommentUseCase>(
      () => DeleteCommentUseCase(sl()),
    );
}
