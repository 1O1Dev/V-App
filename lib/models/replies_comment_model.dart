// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:v_app/models/model.dart';

class RepliesCommentModel {
  final String id;
  final String userId;
  final String commentId;
  final String postId;
  final String title;
  final String createdAt;
  final String updatedAt;
  RepliesCommentModel({
    required this.id,
    required this.userId,
    required this.commentId,
    required this.postId,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'userId': userId,
      'commentId': commentId,
      'postId': postId,
      'title': title,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory RepliesCommentModel.fromMap(Map<String, dynamic> map) {
    return RepliesCommentModel(
      id: map['_id'] as String,
      userId: map['userId'] as String,
      commentId: map['commentId'] as String,
      postId: map['postId'] as String,
      title: map['title'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RepliesCommentModel.fromJson(String source) =>
      RepliesCommentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class RepliesCommentPost {
  final UserModel user;
  final RepliesCommentModel repliesComment;
  RepliesCommentPost({
    required this.user,
    required this.repliesComment,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'repliesComment': repliesComment.toMap(),
    };
  }

  factory RepliesCommentPost.fromMap(Map<String, dynamic> map) {
    return RepliesCommentPost(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
      repliesComment: RepliesCommentModel.fromMap(
          map['repliesComment'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory RepliesCommentPost.fromJson(String source) =>
      RepliesCommentPost.fromMap(json.decode(source) as Map<String, dynamic>);
}
