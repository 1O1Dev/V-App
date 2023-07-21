import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_app/models/model.dart';
import 'package:v_app/services/comment_service.dart';

final commentRep = Provider((ref) => CommentServices());

final commentsProvider = FutureProvider.autoDispose
    .family<List<CommentPostModel>, String>((ref, postId) {
  final comments = ref.read(commentRep).getCommentPost(postId);
  return comments;
});
