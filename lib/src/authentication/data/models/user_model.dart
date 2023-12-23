import 'dart:convert';

import 'package:exam_app/core/utilities/typedef.dart';
import 'package:exam_app/src/authentication/domain/entities/user.dart';

class UserModel extends User{
  const UserModel({required super.id, required super.createdAt, required super.name, required super.avatar});

  const UserModel.empty() :
        this(id: '1', createdAt: 'empty.createdAt', name: 'empty.name', avatar: 'empty.avatar') ;

  factory UserModel.fromJson(String source) => UserModel.fromMap(jsonDecode(source) as DataMap);


  UserModel copyWith({
    String? id,
    String? createdAt,
    String? name,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }

  DataMap toMap() {
    return {
      'id': id,
      'createdAt': createdAt,
      'name': name,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(DataMap map) {
    return UserModel(
      id: map['id'] as String,
      createdAt: map['createdAt'] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
    );
  }


}