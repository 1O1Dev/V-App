import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../configs/config.dart';
import '../../models/model.dart';
import '../../providers/provider.dart';
import '../component.dart';

class CommentPost extends StatelessWidget {
  final String postId;
  const CommentPost({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          padding: const EdgeInsets.symmetric(
            horizontal: appDefaultPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 2,
                width: 60,
                decoration: BoxDecoration(
                  color: greyColor.shade300,
                  borderRadius: BorderRadius.circular(
                    appDefaultBorderRadius,
                  ),
                ),
              ),
              const Text(""),
            ],
          ),
        ),
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              final commentPro = ref.watch(commentsProvider(postId));
              return commentPro.map(
                data: (data) {
                  List<CommentPostModel> commentsList = data.value;
                  return Comment(commentsList: commentsList);
                },
                error: (error) => PostErrorCard(onTap: () {}),
                loading: (loading) => const CommentLoading(),
              );
            },
          ),
        ),
      ],
    );
  }
}
