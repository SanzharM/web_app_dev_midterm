import 'dart:math';

import 'package:web_app_dev_midterm/src/core/utils/utils.dart';
import 'package:web_app_dev_midterm/src/data/datasources/user_datasource.dart';
import 'package:web_app_dev_midterm/src/domain/entities/comment_entity.dart';
import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/domain/entities/user_entity.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/comment/add_comment_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/add_post_usecase.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/get_post_usecase.dart';

Duration getRandomDuration({int maxMilliseconds = 800}) {
  return Duration(
    milliseconds: Random.secure().nextInt(maxMilliseconds),
  );
}

abstract class PostDatasource {
  Future<List<PostEntity>> getPosts();
  Future<PostEntity> getPostDetails(GetPostParams params);

  Future<PostEntity> addPost(AddPostParams params);
  Future<void> deletePost(int postId);

  Future<CommentEntity> addComment(AddCommentParams params);
  Future<void> deleteComment(int commentId);
}

class PostDatasourceImpl implements PostDatasource {
  @override
  Future<PostEntity> getPostDetails(GetPostParams params) async {
    await Future.delayed(getRandomDuration());

    return PostEntity.fromMap(post1);
  }

  @override
  Future<List<PostEntity>> getPosts() async {
    await Future.delayed(getRandomDuration(maxMilliseconds: 1000)); // 1 sec

    return List.filled(5, PostEntity.fromMap(post1));
  }

  @override
  Future<PostEntity> addPost(AddPostParams params) async {
    await Future.delayed(getRandomDuration(maxMilliseconds: 500));

    return params.post;
  }

  @override
  Future<void> deletePost(int postId) async {
    await Future.delayed(getRandomDuration(maxMilliseconds: 400));

    return;
  }

  @override
  Future<CommentEntity> addComment(AddCommentParams params) async {
    await Future.delayed(getRandomDuration());

    final Map<String, dynamic> map = {
      'user': userFakeData,
      'post_id': params.postId,
      'comment': params.comment,
      'created_at': Utils.formatDate(
        DateTime.now(),
        format: 'yyyy-MM-dd HH:mm:ss',
      ),
    };

    return CommentEntity.fromMap(map);
  }

  @override
  Future<void> deleteComment(int commentId) async {
    await Future.delayed(getRandomDuration());

    return;
  }
}

Map<String, dynamic> post1 = {
  'id': 44,
  'author': 'McDONALDS',
  'nickname': '@iDoEverythingForKids',
  'avatar_url':
      'https://pbs.twimg.com/profile_images/1678414062441381888/K1V_1xZb_400x400.png',
  'text':
      'SALHDAJLSDJLA JSAKJADHKSskjdhak sjdhak sjh akshdakjdak sjhda ksjhdak shdak sjhdkahskh adksjdhaskjd sadkasld~!!!!\naskjdaskldj askdj alskd alks',
  'posted_at': DateTime.now().subtract(
    getRandomDuration(maxMilliseconds: 60000), // -60 seconds
  ),
  'attachments': <String>[
    'https://www.eatthis.com/wp-content/uploads/sites/4/2023/04/McDonalds-1.jpg?quality=82&strip=1',
  ],
  'comments': [
    CommentEntity(
      id: 1,
      user: UserEntity.fromMap(userFakeData),
      comment: 'Awesome!!! Wanna try it by urself!!!!',
      createdAt: DateTime.now(),
      postId: 44,
    ).toMap(),
    CommentEntity(
      id: 2,
      user: UserEntity.fromMap(userFakeData),
      comment:
          'Oh loooor... i was there yesterday and the taste was soooooooo f*cking awful!!! never gonna come back((',
      createdAt: DateTime.now(),
      postId: 44,
    ).toMap(),
    CommentEntity(
      id: 3,
      user: UserEntity.fromMap(userFakeData),
      comment: 'Default.',
      createdAt: DateTime.now(),
      postId: 44,
    ).toMap(),
  ]
};
