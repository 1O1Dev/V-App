import 'dart:convert';

class FollowModel {
  final String id;
  final String userId;
  final String followUserId;
  final String createdAt;
  final String updatedAt;
  FollowModel({
    required this.id,
    required this.userId,
    required this.followUserId,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'userId': userId,
      'followUserId': followUserId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory FollowModel.fromMap(Map<String, dynamic> map) {
    return FollowModel(
      id: map['_id'] as String,
      userId: map['userId'] as String,
      followUserId: map['followUserId'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FollowModel.fromJson(String source) =>
      FollowModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
