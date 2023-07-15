import 'dart:convert';

class CountModel {
  final int likesCount;
  final int repliesCount;
  final int commentsCount;
  final int sharesCount;
  final int tagsCount;
  CountModel({
    required this.likesCount,
    required this.repliesCount,
    required this.commentsCount,
    required this.sharesCount,
    required this.tagsCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'likesCount': likesCount,
      'repliesCount': repliesCount,
      'commentsCount': commentsCount,
      'sharesCount': sharesCount,
      'tagsCount': tagsCount,
    };
  }

  factory CountModel.fromMap(Map<String, dynamic> map) {
    return CountModel(
      likesCount: map['likesCount'] as int,
      repliesCount: map['repliesCount'] as int,
      commentsCount: map['commentsCount'] as int,
      sharesCount: map['sharesCount'] as int,
      tagsCount: map['tagsCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountModel.fromJson(String source) =>
      CountModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
