import 'package:web_app_dev_midterm/src/common/usecase.dart';
import 'package:web_app_dev_midterm/src/domain/repository/post_repository.dart';

class DeletePostUseCase extends UseCase<void, int> {
  final PostRepository _repository;

  DeletePostUseCase(this._repository);

  @override
  Future<void> call({int? params}) {
    if (params == null) {
      throw Exception('Provide post identifier to delete');
    }
    return _repository.deletePost(params);
  }
}
