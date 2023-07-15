import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:v_app/models/model.dart';
import '../configs/config.dart';

class PostServices {
  Future<List<PostModel>> getPost() async {
    try {
      final uri = Uri.parse('$apiUri/posts');
      final res = await http.get(uri);

      List<PostModel> posts = [];

      if (res.statusCode == 200) {
        final postsData = jsonDecode(res.body)['posts'];
        for (var post in postsData) {
          posts.add(PostModel.fromMap(post));
        }
        return posts;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Error to get posts : $e');
    }
  }
}
