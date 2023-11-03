import 'package:equatable/equatable.dart';
import 'package:web_app_dev_midterm/src/common/usecase.dart';
import 'package:web_app_dev_midterm/src/domain/repository/user_repository.dart';

class EditUserUseCase extends UseCase<void, EditUserParams> {
  final UserRepository _repository;

  EditUserUseCase(this._repository);

  @override
  Future<void> call({EditUserParams? params}) {
    if (params == null) {
      throw Exception('Provide user parameters');
    }
    return _repository.editUser(params);
  }
}

class EditUserParams extends Equatable {
  final String? name;
  final String? nickname;
  final DateTime? age;

  const EditUserParams({
    this.name,
    this.nickname,
    this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nickname': nickname,
      'age': age?.millisecondsSinceEpoch,
    };
  }

  @override
  List<Object?> get props => [name, nickname, age];
}
