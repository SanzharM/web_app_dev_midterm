import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'package:web_app_dev_midterm/src/core/utils/utils.dart';
import 'package:web_app_dev_midterm/src/domain/entities/user_entity.dart';

class CommentEntity extends Equatable {
  final int? id;
  final UserEntity? user;
  final int? postId;
  final String? comment;
  final DateTime? createdAt;

  const CommentEntity({
    this.id,
    this.user,
    this.postId,
    this.comment,
    this.createdAt,
  });

  CommentEntity copyWith({
    ValueGetter<int?>? id,
    ValueGetter<UserEntity?>? user,
    ValueGetter<int?>? postId,
    ValueGetter<String?>? comment,
    ValueGetter<DateTime?>? createdAt,
  }) {
    return CommentEntity(
      id: id != null ? id() : this.id,
      user: user != null ? user() : this.user,
      postId: postId != null ? postId() : this.postId,
      comment: comment != null ? comment() : this.comment,
      createdAt: createdAt != null ? createdAt() : this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user?.toMap(),
      'post_id': postId,
      'comment': comment,
      'created_at': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory CommentEntity.fromMap(Map<String, dynamic> map) {
    return CommentEntity(
      id: map['id']?.toInt(),
      user: map['user'] != null ? UserEntity.fromMap(map['user']) : null,
      postId: map['post_id']?.toInt(),
      comment: map['comment'] as String?,
      createdAt: Utils.parseDate(map['created_at'], format: 'yyyy-MM-dd HH:mm:ss'),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentEntity.fromJson(String source) =>
      CommentEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CommentEntity(id: $id, user: $user, postId: $postId, comment: $comment, createdAt: $createdAt)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      user,
      postId,
      comment,
      createdAt,
    ];
  }
}
