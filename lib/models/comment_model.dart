import 'dart:convert';
import 'package:v_app/models/model.dart';

class CommentModel {
  final String id;
  final String userId;
  final String postId;
  final String comment;
  final String createdAt;
  final String updatedAt;
  CommentModel({
    required this.id,
    required this.userId,
    required this.postId,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'userId': userId,
      'postId': postId,
      'comment': comment,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['_id'] as String,
      userId: map['userId'] as String,
      postId: map['postId'] as String,
      comment: map['comment'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CommentPostModel {
  final UserModel user;
  final CommentModel comment;
  final List<RepliesCommentPost> repliesComment;
  CommentPostModel({
    required this.user,
    required this.comment,
    required this.repliesComment,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'comment': comment.toMap(),
      'replies': repliesComment.map((x) => x.toMap()).toList(),
    };
  }

  factory CommentPostModel.fromMap(Map<String, dynamic> map) {
    return CommentPostModel(
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
      comment: CommentModel.fromMap(map['comment'] as Map<String, dynamic>),
      repliesComment: List<RepliesCommentPost>.from(
        (map['replies'] as List<dynamic>).map<RepliesCommentPost>(
          (x) => RepliesCommentPost.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentPostModel.fromJson(String source) =>
      CommentPostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
