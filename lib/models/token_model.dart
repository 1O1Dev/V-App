import 'dart:convert';

class TokenModel {
  final String accessToken;
  final String refreshToken;
  TokenModel({
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
