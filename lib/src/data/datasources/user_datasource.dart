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
  @override
  Future<UserEntity> getUserDetails() async {
    await Future.delayed(getRandomDuration());

    return UserEntity.fromMap(userFakeData);
  }

  @override
  Future<void> editUser(EditUserParams params) async {
    await Future.delayed(getRandomDuration());

    return;
  }
}

const Map<String, dynamic> userFakeData = {
  'id': 123,
  'username': 'Sanzh1k',
  'nickname': 'sanzhar_manabayev',
  'avatar_url': 'https://avatars.githubusercontent.com/u/56864444?v=4',
};
