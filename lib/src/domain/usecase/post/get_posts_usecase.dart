import 'package:web_app_dev_midterm/src/common/usecase.dart';
import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/domain/repository/post_repository.dart';

class GetPostsUseCase extends UseCase<List<PostEntity>, void> {
  final PostRepository _repository;

  GetPostsUseCase(this._repository);

  @override
  Future<List<PostEntity>> call({void params}) {
    return _repository.getPosts();
  }
}
