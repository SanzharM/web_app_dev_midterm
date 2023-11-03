import 'package:web_app_dev_midterm/src/data/datasources/post_datasource.dart';
import 'package:web_app_dev_midterm/src/domain/entities/comment_entity.dart';
import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/domain/repository/post_repository.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/comment/add_comment_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/add_post_usecase.dart';
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

  @override
  Future<PostEntity> addPost(AddPostParams params) {
    return _datasource.addPost(params);
  }

  @override
  Future<void> deletePost(int postId) {
    return _datasource.deletePost(postId);
  }

  @override
  Future<CommentEntity> addComment(AddCommentParams params) {
    return _datasource.addComment(params);
  }

  @override
  Future<void> deleteComment(int commentId) {
    return _datasource.deleteComment(commentId);
  }
}
