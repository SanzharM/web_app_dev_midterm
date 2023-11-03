import 'package:web_app_dev_midterm/src/domain/entities/comment_entity.dart';
import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/comment/add_comment_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/add_post_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/get_post_usecase.dart';

abstract class PostRepository {
  Future<PostEntity> getPostDetails(GetPostParams params);
  Future<List<PostEntity>> getPosts();

  Future<PostEntity> addPost(AddPostParams params);
  Future<void> deletePost(int postId);

  Future<CommentEntity> addComment(AddCommentParams comment);
  Future<void> deleteComment(int commentId);
}
