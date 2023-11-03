import 'package:web_app_dev_midterm/src/common/usecase.dart';
import 'package:web_app_dev_midterm/src/domain/entities/user_entity.dart';
import 'package:web_app_dev_midterm/src/domain/repository/user_repository.dart';

class GetUserUseCase extends UseCase<UserEntity, void> {
  final UserRepository _repository;

  GetUserUseCase(this._repository);

  @override
  Future<UserEntity> call({void params}) {
    return _repository.getUserDetails();
  }
}
