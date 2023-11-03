part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState({
    this.user = const UserEntity(),
    this.status = StateStatus.initial,
    this.message = '',
  });

  final UserEntity user;
  final StateStatus status;
  final String message;

  @override
  List<Object> get props => [user, status, message];

  bool get isAuthorized => user.isAuthorized;
  bool get isNotAuthorized => !isAuthorized;

  UserState copyWith({
    UserEntity? user,
    StateStatus? status,
    String? message,
  }) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
      message: message ?? '',
    );
  }
}
