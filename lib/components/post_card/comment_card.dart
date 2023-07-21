import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:v_app/utils/date_util.dart';
import '../../configs/config.dart';
import '../../models/model.dart';
import '../../pages/page.dart';
import '../component.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
    required this.comment,
  });

  final CommentPostModel comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: appDefaultPadding / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FriendProfilePage(
                      userId: comment.user.id,
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
                      '${comment.user.name} ${comment.user.lastName}',
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
                formateDate(comment.comment.createdAt),
                style: const TextStyle(
                  color: greyColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: appDefaultPadding / 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: appDefaultPadding * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      child: Text(comment.comment.comment),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(
                                  appDefaultBorderRadius * 2),
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
                              borderRadius: BorderRadius.circular(
                                  appDefaultBorderRadius * 2),
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
                        comment.repliesComment.isNotEmpty
                            ? Text(
                                "${comment.repliesComment.length} Replies",
                                style: const TextStyle(fontSize: 12),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: appDefaultPadding / 2),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 12),
                shrinkWrap: true,
                itemCount: comment.repliesComment.length,
                itemBuilder: (context, index) {
                  final replies = comment.repliesComment[index];
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: appDefaultPadding * 2.2,
                        ),
                        child: RepliesCommentCard(
                          replies: replies,
                          comment: comment,
                        ),
                      ),
                      Positioned(
                        left: -2,
                        top: -8,
                        child: SizedBox(
                          height: 20,
                          width: 25,
                          child: CustomPaint(
                            painter: CustomCurvePainter(),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
