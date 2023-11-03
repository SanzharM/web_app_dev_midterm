import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:web_app_dev_midterm/src/common/state_status.dart';
import 'package:web_app_dev_midterm/src/core/l10n/l10n_service.dart';
import 'package:web_app_dev_midterm/src/domain/entities/user_entity.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/user/edit_user_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/user/get_user_usecase.dart';
import 'package:web_app_dev_midterm/src/service_locator.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  void get() => add(UserGetEvent());
  void edit(UserEntity newUser) => add(UserEditEvent(newUser));

  UserBloc() : super(const UserState()) {
    on<UserGetEvent>(_get);
    on<UserEditEvent>(_edit);
  }

  final GetUserUseCase _getUserUseCase = sl<GetUserUseCase>();
  final EditUserUseCase _editUserUseCase = sl<EditUserUseCase>();

  void _get(
    UserGetEvent event,
    Emitter<UserState> emit,
  ) async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    try {
      final UserEntity user = await _getUserUseCase.call();
      emit(state.copyWith(
        status: StateStatus.success,
        user: user,
      ));
    } catch (e) {
      debugPrint('UserGetEvent error: $e');
      emit(state.copyWith(
        status: StateStatus.error,
        message: L10n.current.somethingWentWrong,
      ));
    }
  }

  void _edit(
    UserEditEvent event,
    Emitter<UserState> emit,
  ) async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));
    try {
      final EditUserParams params = EditUserParams(
        nickname: event.newUser.nickname,
        name: event.newUser.username,
      );
      await _editUserUseCase.call(params: params);
      emit(state.copyWith(
        status: StateStatus.success,
        user: event.newUser,
      ));
    } catch (e) {
      debugPrint('UserEditEvent error: $e');
      emit(state.copyWith(
        status: StateStatus.error,
        message: L10n.current.somethingWentWrong,
      ));
    }
  }
}
