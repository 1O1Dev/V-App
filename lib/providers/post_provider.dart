import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_app/services/post_service.dart';

final postRep = Provider((ref) => PostServices());

final postsProvider = FutureProvider((ref) {
  final posts = ref.read(postRep).getPost();
  return posts;
});
