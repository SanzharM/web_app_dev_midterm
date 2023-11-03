import 'package:web_app_dev_midterm/src/data/datasources/post_datasource.dart';
import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/domain/repository/post_repository.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/get_post_usecase.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDatasource _datasource;

  PostRepositoryImpl(this._datasource);

  @override
  Future<PostEntity> getPostDetails(GetPostParams params) {
    return _datasource.getPostDetails(params);
  }

  @override
  Future<List<PostEntity>> getPosts() {
    return _datasource.getPosts();
  }
}
