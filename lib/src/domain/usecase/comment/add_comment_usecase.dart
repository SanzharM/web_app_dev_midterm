import 'package:equatable/equatable.dart';

import 'package:web_app_dev_midterm/src/common/usecase.dart';
import 'package:web_app_dev_midterm/src/domain/entities/comment_entity.dart';
import 'package:web_app_dev_midterm/src/domain/repository/post_repository.dart';

class AddCommentUseCase extends UseCase<CommentEntity, AddCommentParams> {
  final PostRepository _repository;

  AddCommentUseCase(this._repository);

  @override
  Future<CommentEntity> call({AddCommentParams? params}) {
    if (params == null) {
      throw Exception('Provide comment');
    }
    return _repository.addComment(params);
  }
}

class AddCommentParams extends Equatable {
  final int postId;
  final String comment;

  const AddCommentParams({
    required this.postId,
    required this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'post_id': postId,
      'comment': comment,
    };
  }

  @override
  List<Object> get props => [postId, comment];
}
