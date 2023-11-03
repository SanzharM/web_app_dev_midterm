part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeGetPostsEvent extends HomeEvent {}

class HomeGetPostEvent extends HomeEvent {
  final int id;

  const HomeGetPostEvent(this.id);

  @override
  List<Object> get props => [id];
}
