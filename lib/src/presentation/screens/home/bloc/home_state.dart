part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.posts = const [],
    this.status = StateStatus.initial,
    this.message = '',
  });

  final List<PostEntity> posts;
  final StateStatus status;
  final String message;

  @override
  List<Object> get props => [posts, status, message];

  HomeState copyWith({
    List<PostEntity>? posts,
    StateStatus? status,
    String? message,
  }) {
    return HomeState(
      posts: posts ?? this.posts,
      status: status ?? this.status,
      message: message ?? '',
    );
  }
}

class HomePostLoadedState extends HomeState {
  final PostEntity post;

  const HomePostLoadedState({
    required this.post,
    required super.posts,
    super.status = StateStatus.initial,
    super.message,
  });

  factory HomePostLoadedState.fromState(HomeState state, PostEntity post) {
    return HomePostLoadedState(post: post, posts: state.posts);
  }
}
