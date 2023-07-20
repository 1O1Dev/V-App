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
  final PostOneModel post;
  final CountModel count;
  final List<CommentModel> comments;
  PostModel({
    required this.post,
    required this.count,
    required this.comments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'post': post.toMap(),
      'count': count.toMap(),
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      post: PostOneModel.fromMap(map['post'] as Map<String, dynamic>),
      count: CountModel.fromMap(map['count'] as Map<String, dynamic>),
      comments: List<CommentModel>.from(
        (map['comments'] as List<dynamic>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
