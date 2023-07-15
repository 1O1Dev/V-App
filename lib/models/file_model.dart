import 'dart:convert';

class FileModel {
  final String id;
  final String fileType;
  final String fileUri;
  FileModel({
    required this.id,
    required this.fileType,
    required this.fileUri,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'fileType': fileType,
      'fileUri': fileUri,
    };
  }

  factory FileModel.fromMap(Map<String, dynamic> map) {
    return FileModel(
      id: map['_id'] as String,
      fileType: map['fileType'] as String,
      fileUri: map['fileUri'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileModel.fromJson(String source) =>
      FileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
