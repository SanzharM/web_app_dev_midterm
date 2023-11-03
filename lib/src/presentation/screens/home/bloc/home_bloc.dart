import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:web_app_dev_midterm/src/common/state_status.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';
import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/get_post_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/get_posts_usecase.dart';
import 'package:web_app_dev_midterm/src/service_locator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  void getPosts() => add(HomeGetPostsEvent());
  void getPostById(int id) => add(HomeGetPostEvent(id));

  HomeBloc() : super(const HomeState()) {
    on<HomeGetPostsEvent>(_getPosts);
    on<HomeGetPostEvent>(_getPostDetails);
  }

  final _getPostsUseCase = sl<GetPostsUseCase>();
  final _getPostUseCase = sl<GetPostUseCase>();

  void _getPosts(
    HomeGetPostsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));

    try {
      final posts = await _getPostsUseCase.call();

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
    emit(state.copyWith());

    try {
      final params = GetPostParams(event.id);
      final post = await _getPostUseCase.call(params: params);
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
