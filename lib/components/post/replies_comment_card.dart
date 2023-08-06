import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../configs/config.dart';
import '../../models/model.dart';
import '../../pages/page.dart';
import '../../utils/util.dart';

class RepliesCommentCard extends StatelessWidget {
  const RepliesCommentCard({
    super.key,
    required this.replies,
    required this.comment,
  });

  final RepliesCommentPost replies;
  final CommentPostModel comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FriendProfilePage(
                    userId: replies.user.id,
                  ),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                      comment.user.profileImage,
                    ),
                  ),
                  const SizedBox(width: appDefaultPadding / 2),
                  Text(
                    '${replies.user.name} ${replies.user.lastName}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: appDefaultPadding / 2),
                  const Icon(
                    Icons.verified,
                    color: blueColor,
                    size: 14,
                  ),
                ],
              ),
            ),
            const SizedBox(width: appDefaultPadding),
            Text(
              formateDate(replies.repliesComment.createdAt),
              style: const TextStyle(
                color: greyColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: appDefaultPadding / 2),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: appDefaultPadding,
            vertical: appDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: greyColor.shade100,
            borderRadius: BorderRadius.circular(
              appDefaultBorderRadius,
            ),
          ),
          child: Text(replies.repliesComment.title),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(appDefaultBorderRadius * 2),
              child: SizedBox(
                height: 30,
                width: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: SvgPicture.asset(
                    'assets/icons/like.svg',
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(appDefaultBorderRadius * 2),
              child: SizedBox(
                height: 30,
                width: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: SvgPicture.asset(
                    'assets/icons/comment.svg',
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: appDefaultPadding / 2),
      ],
    );
  }
}
