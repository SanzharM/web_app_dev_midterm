import 'package:equatable/equatable.dart';

import 'package:web_app_dev_midterm/src/common/usecase.dart';
import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/domain/repository/post_repository.dart';

class GetPostUseCase extends UseCase<PostEntity, GetPostParams> {
  final PostRepository _repository;

  GetPostUseCase(this._repository);

  @override
  Future<PostEntity> call({GetPostParams? params}) {
    if (params == null) {
      throw Exception('Provide post parameters');
    }
    return _repository.getPostDetails(params);
  }
}

class GetPostParams extends Equatable {
  final int? id;

  const GetPostParams(this.id);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  @override
  List<Object?> get props => [id];
}
