import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:web_app_dev_midterm/src/core/utils/utils.dart';

class PostEntity extends Equatable {
  final int? id;
  final String? author;
  final String? nickname;
  final String? avatarUrl;
  final DateTime? postedAt;
  final String? text;
  final List<String>? attachments;

  const PostEntity({
    this.id,
    this.author,
    this.nickname,
    this.avatarUrl,
    this.postedAt,
    this.text,
    this.attachments,
  });

  PostEntity copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? author,
    ValueGetter<String?>? nickname,
    ValueGetter<String?>? avatarUrl,
    ValueGetter<DateTime?>? postedAt,
    ValueGetter<String?>? text,
    ValueGetter<List<String>?>? attachments,
  }) {
    return PostEntity(
      id: id != null ? id() : this.id,
      author: author != null ? author() : this.author,
      nickname: nickname != null ? nickname() : this.nickname,
      avatarUrl: avatarUrl != null ? avatarUrl() : this.avatarUrl,
      postedAt: postedAt != null ? postedAt() : this.postedAt,
      text: text != null ? text() : this.text,
      attachments: attachments != null ? attachments() : this.attachments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'nickname': nickname,
      'avatarUrl': avatarUrl,
      'postedAt': postedAt?.millisecondsSinceEpoch,
      'text': text,
      'attachments': attachments,
    };
  }

  factory PostEntity.fromMap(Map<String, dynamic> map) {
    return PostEntity(
      id: map['id']?.toInt(),
      author: map['author'] as String?,
      nickname: map['nickname'] as String?,
      avatarUrl: map['avatar_url'] as String?,
      postedAt: Utils.parseDate(map['postedAt'], format: 'yyyy-MM-dd HH:mm:ss'),
      text: map['text'] as String?,
      attachments: map['attachments'] != null && map['attachments'] is List
          ? (map['attachments'] as List).map((e) => '$e').toList()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostEntity.fromJson(String source) => PostEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostEntity(id: $id, author: $author, nickname: $nickname, avatarUrl: $avatarUrl, postedAt: $postedAt, text: $text, attachments: $attachments)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      author,
      nickname,
      avatarUrl,
      postedAt,
      text,
      attachments,
    ];
  }
}
