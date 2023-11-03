import 'package:equatable/equatable.dart';
import 'package:web_app_dev_midterm/src/common/usecase.dart';
import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/domain/repository/post_repository.dart';

class AddPostUseCase extends UseCase<PostEntity, AddPostParams> {
  final PostRepository _repository;

  AddPostUseCase(this._repository);

  @override
  Future<PostEntity> call({AddPostParams? params}) {
    if (params == null) {
      throw Exception('Provide a post to create');
    }
    return _repository.addPost(params);
  }
}

class AddPostParams extends Equatable {
  final PostEntity post;

  const AddPostParams(this.post);

  @override
  List<Object> get props => [post];
}
