import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:web_app_dev_midterm/src/common/state_status.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';
import 'package:web_app_dev_midterm/src/data/datasources/post_datasource.dart';
import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/get_post_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  void getPosts() => add(HomeGetPostsEvent());
  void getPostById(int id) => add(HomeGetPostEvent(id));

  HomeBloc() : super(const HomeState()) {
    on<HomeGetPostsEvent>(_getPosts);
    on<HomeGetPostEvent>(_getPostDetails);
  }

  void _getPosts(
    HomeGetPostsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));
    await Future.delayed(const Duration(milliseconds: 700));

    try {
      final posts = await const PostDatasourceImpl().getPosts();

      emit(state.copyWith(
        status: StateStatus.success,
        posts: posts,
      ));
    } catch (e) {
      debugPrint('HomeGetPostsEvent error: $e');
      emit(state.copyWith(
        status: StateStatus.error,
        message: L10n.current.somethingWentWrong,
      ));
    }
  }

  void _getPostDetails(
    HomeGetPostEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));

    try {
      final params = GetPostParams(event.id);
      final post = await const PostDatasourceImpl().getPostDetails(params);
      emit(HomePostLoadedState.fromState(state, post));
    } catch (e) {
      debugPrint('HomeGetPostsEvent error: $e');
      emit(state.copyWith(
        status: StateStatus.error,
        message: L10n.current.somethingWentWrong,
      ));
    }
  }
}
