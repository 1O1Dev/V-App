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

      if (res.statusCode != 200) return [];

      final postsData = jsonDecode(res.body)['posts'];
      for (var post in postsData) {
        posts.add(PostModel.fromMap(post));
      }
      return posts;
    } catch (e) {
      throw Exception('Error to get posts : $e');
    }
  }

  Future<bool> createPost(CreatePostModel post) async {
    try {
      final uri = Uri.parse('$apiUri/posts/create');
      final body = jsonEncode(post.toMap());
      print('body: $body');
      final res = await http.post(uri, body: body);
      print('res: ${res.body}');

      if (res.statusCode == 200) return true;
      return false;
    } catch (e) {
      throw Exception('Error to get posts : $e');
    }
  }
}
