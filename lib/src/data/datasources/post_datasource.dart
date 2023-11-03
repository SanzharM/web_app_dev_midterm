import 'dart:math';

import 'package:web_app_dev_midterm/src/core/local_storage/local_storage.dart';
import 'package:web_app_dev_midterm/src/domain/entities/post_entity.dart';
import 'package:web_app_dev_midterm/src/domain/usecase/post/get_post_usecase.dart';

Duration getRandomDuration({int maxMilliseconds = 500}) {
  return Duration(
    milliseconds: Random.secure().nextInt(maxMilliseconds),
  );
}

abstract class PostDatasource {
  Future<List<PostEntity>> getPosts();
  Future<PostEntity> getPostDetails(GetPostParams params);
}

class PostDatasourceImpl implements PostDatasource {
  final dynamic _api;
  final LocalStorage _localStorage;

  const PostDatasourceImpl(this._api, this._localStorage);

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
}

Map<String, dynamic> post1 = {
  'id': DateTime.now().microsecondsSinceEpoch,
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
};
