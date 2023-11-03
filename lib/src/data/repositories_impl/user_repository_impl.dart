import 'package:web_app_dev_midterm/src/data/datasources/user_datasource.dart';
import 'package:web_app_dev_midterm/src/domain/entities/user_entity.dart';
import 'package:web_app_dev_midterm/src/domain/repository/user_repository.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/user/edit_user_usecase.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource _datasource;

  UserRepositoryImpl(this._datasource);

  @override
  Future<void> editUser(EditUserParams params) async {
    return _datasource.editUser(params);
  }

  @override
  Future<UserEntity> getUserDetails() async {
    return _datasource.getUserDetails();
  }
}
