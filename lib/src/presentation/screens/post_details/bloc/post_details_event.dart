part of 'post_details_bloc.dart';

abstract class PostDetailsEvent extends Equatable {
  const PostDetailsEvent();

  @override
  List<Object?> get props => [];
}

class PostDetailsGetEvent extends PostDetailsEvent {}

class PostDetailsAddCommentEvent extends PostDetailsEvent {
  final String message;

  const PostDetailsAddCommentEvent(this.message);

  @override
  List<Object?> get props => [message];
}

class PostDetailsDeleteCommentEvent extends PostDetailsEvent {
  final int commentId;

  const PostDetailsDeleteCommentEvent(this.commentId);

  @override
  List<Object?> get props => [commentId];
}
