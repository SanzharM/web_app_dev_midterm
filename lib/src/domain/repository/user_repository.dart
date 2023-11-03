import 'package:web_app_dev_midterm/src/domain/entities/user_entity.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/user/edit_user_usecase.dart';

abstract class UserRepository {
  Future<UserEntity> getUserDetails();
  Future<void> editUser(EditUserParams params);
}
