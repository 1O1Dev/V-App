// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:v_app/models/model.dart';

class UserModel {
  final String id;
  final String name;
  final String lastName;
  final String profileImage;
  final String email;
  final String password;
  final String createdAt;
  final String updatedAt;
  UserModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.profileImage,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'lastName': lastName,
      'profileImage': profileImage,
      'email': email,
      'password': password,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      profileImage: map['profileImage'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SearchUserModel {
  final UserModel user;
  final List<FollowModel> followers;
  final List<FollowModel> followings;
  SearchUserModel({
    required this.user,
    required this.followers,
    required this.followings,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'followers': followers.map((x) => x.toMap()).toList(),
      'followings': followings.map((x) => x.toMap()).toList(),
    };
  }

  factory SearchUserModel.fromMap(Map<String, dynamic> map) {
    return SearchUserModel(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
      followers: List<FollowModel>.from(
        (map['followers'] as List<dynamic>).map<FollowModel>(
          (x) => FollowModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      followings: List<FollowModel>.from(
        (map['followings'] as List<dynamic>).map<FollowModel>(
          (x) => FollowModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchUserModel.fromJson(String source) =>
      SearchUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class UserModelOne {
  final UserModel user;
  final CountModel count;
  UserModelOne({
    required this.user,
    required this.count,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'count': count.toMap(),
    };
  }

  factory UserModelOne.fromMap(Map<String, dynamic> map) {
    return UserModelOne(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
      count: CountModel.fromMap(map['count'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelOne.fromJson(String source) =>
      UserModelOne.fromMap(json.decode(source) as Map<String, dynamic>);
}
