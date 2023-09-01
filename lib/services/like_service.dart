import 'dart:convert';
import '../configs/config.dart';
import 'package:http/http.dart' as http;

class LikeServices {
  Future<bool> likePost(String postId) async {
    try {
      var headersList = {'Accept': '*/*', 'Content-Type': 'application/json'};
      final uri = Uri.parse('$apiUri/like-post');
      final body = jsonEncode({
        "postId": postId,
        "userId": userId,
      });
      final res = await http.post(uri, body: body, headers: headersList);
      if (res.statusCode == 200) return true;
      return false;
    } catch (e) {
      throw Exception("Error to like post : $e");
    }
  }
}
