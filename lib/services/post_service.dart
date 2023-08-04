import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:v_app/models/model.dart';
import '../configs/config.dart';

class PostServices {
  Future<List<PostModel>> getPost() async {
    try {
      List<PostModel> posts = [];
      final uri = Uri.parse('$apiUri/posts');
      final res = await http.get(uri);

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
      var headersList = {'Accept': '*/*', 'Content-Type': 'application/json'};
      var postData = {
        "userId": "64b9fe35a22d03403a8f93de",
        "title": post.title,
        "files": [
          {
            "fileType": "image",
            "fileUri":
                "https://i.pinimg.com/736x/ed/ac/90/edac90cf0b53e94f6f209a54783b8a41.jpg"
          },
          {
            "fileType": "image",
            "fileUri":
                "https://i.pinimg.com/564x/a5/5f/60/a55f6057fe71fedac260c39660afc420.jpg"
          },
          {
            "fileType": "image",
            "fileUri":
                "https://i.pinimg.com/736x/3e/2f/31/3e2f31d8b8adeec9a7775889ce5ebb0e.jpg"
          },
          {
            "fileType": "image",
            "fileUri":
                "https://i.pinimg.com/736x/04/02/c1/0402c13e79aaef715d1541330813e5ab.jpg"
          }
        ]
      };
      final uri = Uri.parse('$apiUri/posts/create');
      final body = jsonEncode(postData);
      final res = await http.post(
        uri,
        body: body,
        headers: headersList,
      );

      print(res.body);

      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error to create post : $e');
    }
  }
}
