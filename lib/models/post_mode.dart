// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:v_app/models/model.dart';

class PostOneModel {
  final String id;
  final String userId;
  final String title;
  final String createdAt;
  final String updatedAt;
  final List<FileModel> files;
  PostOneModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.files,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'userId': userId,
      'title': title,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'files': files.map((x) => x.toMap()).toList(),
    };
  }

  factory PostOneModel.fromMap(Map<String, dynamic> map) {
    return PostOneModel(
      id: map['_id'] as String,
      userId: map['userId'] as String,
      title: map['title'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      files: List<FileModel>.from(
        (map['files'] as List<dynamic>).map<FileModel>(
          (x) => FileModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostOneModel.fromJson(String source) =>
      PostOneModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PostModel {
  final UserModel user;
  final PostOneModel post;
  final CountModel count;
  final List<UserModel> threePeople;
  PostModel({
    required this.user,
    required this.post,
    required this.count,
    required this.threePeople,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'post': post.toMap(),
      'count': count.toMap(),
      'threePeople': threePeople.map((x) => x.toMap()).toList(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
      post: PostOneModel.fromMap(map['post'] as Map<String, dynamic>),
      count: CountModel.fromMap(map['count'] as Map<String, dynamic>),
      threePeople: List<UserModel>.from(
        (map['threePeople'] as List<dynamic>).map<UserModel>(
          (x) => UserModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CreatePostModel {
  final String userId;
  final String title;
  final List<CreateFileModel> files;
  CreatePostModel({
    required this.userId,
    required this.title,
    required this.files,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'title': title,
      'files': files.map((x) => x.toMap()).toList(),
    };
  }

  factory CreatePostModel.fromMap(Map<String, dynamic> map) {
    return CreatePostModel(
      userId: map['userId'] as String,
      title: map['title'] as String,
      files: List<CreateFileModel>.from(
        (map['files'] as List<dynamic>).map<CreateFileModel>(
          (x) => CreateFileModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatePostModel.fromJson(String source) =>
      CreatePostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CreateFileModel {
  final String fileType;
  final String fileUri;
  CreateFileModel({
    required this.fileType,
    required this.fileUri,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fileType': fileType,
      'fileUri': fileUri,
    };
  }

  factory CreateFileModel.fromMap(Map<String, dynamic> map) {
    return CreateFileModel(
      fileType: map['fileType'] as String,
      fileUri: map['fileUri'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateFileModel.fromJson(String source) =>
      CreateFileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}