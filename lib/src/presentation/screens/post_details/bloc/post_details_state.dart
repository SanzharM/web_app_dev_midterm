part of 'post_details_bloc.dart';

class PostDetailsState extends Equatable {
  const PostDetailsState(
      {required this.post, this.status = StateStatus.initial, this.message = ''});

  final PostEntity post;
  final StateStatus status;
  final String message;

  @override
  List<Object> get props => [post, status, message];

  PostDetailsState copyWith({
    PostEntity? post,
    StateStatus? status,
    String? message,
  }) {
    return PostDetailsState(
      post: post ?? this.post,
      status: status ?? this.status,
      message: message ?? '',
    );
  }
}
