import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? username;
  final String? nickname;
  final String? avatarUrl;
  final bool isAuthorized;

  const UserEntity({
    this.id,
    this.username,
    this.nickname,
    this.avatarUrl,
    this.isAuthorized = false,
  });

  UserEntity copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? username,
    ValueGetter<String?>? nickname,
    ValueGetter<String?>? avatarUrl,
    bool? isAuthorized,
  }) {
    return UserEntity(
      id: id != null ? id() : this.id,
      username: username != null ? username() : this.username,
      nickname: nickname != null ? nickname() : this.nickname,
      avatarUrl: avatarUrl != null ? avatarUrl() : this.avatarUrl,
      isAuthorized: isAuthorized ?? this.isAuthorized,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'nickname': nickname,
      'avatarUrl': avatarUrl,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id']?.toInt(),
      username: map['username'] as String?,
      nickname: map['nickname'] as String?,
      avatarUrl: map['avatar_url'] as String?,
      isAuthorized: true,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) => UserEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserEntity(id: $id, username: $username, nickname: $nickname, avatarUrl: $avatarUrl, isAuthorized: $isAuthorized)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      username,
      nickname,
      avatarUrl,
      isAuthorized,
    ];
  }
}
