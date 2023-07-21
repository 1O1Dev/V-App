import 'package:flutter/material.dart';
import '../../configs/config.dart';
import '../../models/model.dart';
import '../component.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
    required this.commentsList,
  });

  final List<CommentPostModel> commentsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: appDefaultPadding,
        vertical: appDefaultPadding / 2,
      ),
      itemCount: commentsList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final comment = commentsList[index];
        return Stack(
          children: [
            CommentCard(comment: comment),
            Positioned(
              left: 10,
              top: 30,
              bottom: 20,
              child: Container(color: greyColor.shade200, width: 2),
            ),
          ],
        );
      },
    );
  }
}
