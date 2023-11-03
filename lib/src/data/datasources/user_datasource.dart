import 'dart:math';

import 'package:web_app_dev_midterm/src/domain/entities/user_entity.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/user/edit_user_usecase.dart';

Duration getRandomDuration({int maxMilliseconds = 500}) {
  return Duration(
    milliseconds: Random.secure().nextInt(maxMilliseconds),
  );
}

abstract class UserDatasource {
  Future<UserEntity> getUserDetails();
  Future<void> editUser(EditUserParams params);
}

class UserDatasourceImpl implements UserDatasource {
  const UserDatasourceImpl();

  @override
  Future<UserEntity> getUserDetails() async {
    await Future.delayed(getRandomDuration());

    const Map<String, dynamic> data = {
      'id': 123,
      'username': 'Sanzh1k',
      'nickname': 'sanzhar_manabayev'
    };
    return UserEntity.fromMap(data);
  }

  @override
  Future<void> editUser(EditUserParams params) async {
    await Future.delayed(getRandomDuration());

    return;
  }
}
