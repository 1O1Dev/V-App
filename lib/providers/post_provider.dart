import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_app/models/model.dart';
import 'package:v_app/services/post_service.dart';

final postRep = Provider((ref) => PostServices());

final postsProvider = FutureProvider((ref) {
  final posts = ref.read(postRep).getPost();
  return posts;
});

final userPostsProvider =
    FutureProvider.family<List<PostModel>, String>((ref, id) {
  final posts = ref.read(postRep).getUserPosts(id);
  return posts;
});
