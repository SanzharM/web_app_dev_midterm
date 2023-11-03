part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class UserGetEvent extends UserEvent {}

class UserEditEvent extends UserEvent {
  final UserEntity newUser;

  const UserEditEvent(this.newUser);

  @override
  List<Object> get props => [newUser];
}
