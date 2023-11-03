import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:web_app_dev_midterm/src/common/state_status.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';
import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/get_post_usecase.dart';
import 'package:web_app_dev_midterm/src/service_locator.dart';

part 'post_details_event.dart';
part 'post_details_state.dart';

class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  void get() => add(PostDetailsGetEvent());
  void addComment(String message) => add(PostDetailsAddCommentEvent(message));
  void deleteComment(int id) => add(PostDetailsDeleteCommentEvent(id));

  PostDetailsBloc(PostEntity post) : super(PostDetailsState(post: post)) {
    on<PostDetailsGetEvent>(_get);
    on<PostDetailsAddCommentEvent>(_addComment);
    on<PostDetailsDeleteCommentEvent>(_deleteComment);
  }

  final GetPostUseCase _getPostUseCase = sl<GetPostUseCase>();

  void _get(
    PostDetailsGetEvent event,
    Emitter<PostDetailsState> emit,
  ) async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));
    try {
      final PostEntity post = await _getPostUseCase.call(
        params: GetPostParams(state.post.id),
      );
      emit(state.copyWith(
        status: StateStatus.success,
        post: post,
      ));
    } catch (e) {
      debugPrint('PostDetailsGetEvent error: $e');
      emit(state.copyWith(
        status: StateStatus.error,
        message: L10n.current.somethingWentWrong,
      ));
    }
  }

  void _addComment(
    PostDetailsAddCommentEvent event,
    Emitter<PostDetailsState> emit,
  ) async {}

  void _deleteComment(
    PostDetailsDeleteCommentEvent event,
    Emitter<PostDetailsState> emit,
  ) async {}
}
