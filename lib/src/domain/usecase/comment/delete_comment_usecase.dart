import 'package:web_app_dev_midterm/src/common/usecase.dart';
import 'package:web_app_dev_midterm/src/domain/repository/post_repository.dart';

class DeleteCommentUseCase extends UseCase<void, int> {
  final PostRepository _repository;

  DeleteCommentUseCase(this._repository);

  @override
  Future<void> call({int? params}) {
    if (params == null) {
      throw Exception('Provide post identifier');
    }
    return _repository.deleteComment(params);
  }
}
