import 'dart:convert';
import 'package:v_app/models/model.dart';
import 'package:http/http.dart' as http;
import '../configs/api_config.dart';

class CommentServices {
  Future<List<CommentPostModel>> getCommentPost(String postId) async {
    try {
      final uri = Uri.parse('$apiUri/comments/$postId');
      final res = await http.get(uri);

      List<CommentPostModel> comments = [];

      if (res.statusCode != 200) return [];
      final commentsPost = jsonDecode(res.body)['comments'];
      for (var comment in commentsPost) {
        comments.add(CommentPostModel.fromMap(comment));
      }
      return comments;
    } catch (e) {
      throw Exception("Error getting comment on post : $e");
    }
  }
}
