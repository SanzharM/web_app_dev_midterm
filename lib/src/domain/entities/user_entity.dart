import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? username;
  final String? nickname;

  const UserEntity({
    this.id,
    this.username,
    this.nickname,
  });

  UserEntity copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? username,
    ValueGetter<String?>? nickname,
  }) {
    return UserEntity(
      id: id != null ? id() : this.id,
      username: username != null ? username() : this.username,
      nickname: nickname != null ? nickname() : this.nickname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'nickname': nickname,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id']?.toInt(),
      username: map['username'],
      nickname: map['nickname'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) => UserEntity.fromMap(json.decode(source));

  @override
  String toString() => 'UserEntity(id: $id, username: $username, nickname: $nickname)';

  @override
  List<Object?> get props => [id, username, nickname];
}
