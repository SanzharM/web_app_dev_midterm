import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/get_post_usecase.dart';

abstract class PostRepository {
  Future<PostEntity> getPostDetails(GetPostParams params);
  Future<List<PostEntity>> getPosts();
}
