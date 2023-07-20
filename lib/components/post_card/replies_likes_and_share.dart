import 'package:flutter/material.dart';
import 'package:v_app/models/model.dart';
import 'package:v_app/utils/util.dart';
import '../../configs/config.dart';

class RepliesAndLikes extends StatelessWidget {
  final CountModel count;
  final List<CommentModel> comments;
  const RepliesAndLikes({
    Key? key,
    required this.count,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(appDefaultPadding),
      child: Row(
        children: [
          SizedBox(
            height: 16,
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const CircleAvatar(
                radius: 7,
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/2a/a3/18/2aa31838a91db761fe6c57bb61dee42c.jpg',
                ),
              ),
            ),
          ),
          count.repliesCount != 0
              ? Row(
                  children: [
                    SizedBox(
                      width: appDefaultPadding,
                      child: CircleAvatar(
                        radius: 2,
                        backgroundColor: greyColor.shade300,
                      ),
                    ),
                    Text(
                      '${count.repliesCount} replies',
                      style: const TextStyle(color: greyColor, fontSize: 12),
                    ),
                  ],
                )
              : Container(),
          count.likesCount != 0
              ? Row(
                  children: [
                    SizedBox(
                      width: appDefaultPadding,
                      child: CircleAvatar(
                        radius: 2,
                        backgroundColor: greyColor.shade300,
                      ),
                    ),
                    Text(
                      '${count.likesCount} likes',
                      style: const TextStyle(color: greyColor, fontSize: 12),
                    ),
                  ],
                )
              : Container(),
          count.commentsCount != 0
              ? Row(
                  children: [
                    SizedBox(
                      width: appDefaultPadding,
                      child: CircleAvatar(
                        radius: 2,
                        backgroundColor: greyColor.shade300,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          barrierColor: blackColor.withOpacity(0.4),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(appDefaultBorderRadius),
                            ),
                          ),
                          builder: (context) => CommentPost(comments: comments),
                        );
                      },
                      child: Text(
                        '${count.commentsCount} comments',
                        style: const TextStyle(color: greyColor, fontSize: 12),
                      ),
                    ),
                  ],
                )
              : Container(),
          count.repliesCount != 0
              ? Row(
                  children: [
                    SizedBox(
                      width: appDefaultPadding,
                      child: CircleAvatar(
                        radius: 2,
                        backgroundColor: greyColor.shade300,
                      ),
                    ),
                    Text(
                      '${count.repliesCount} shares',
                      style: const TextStyle(color: greyColor, fontSize: 12),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

class CommentPost extends StatelessWidget {
  const CommentPost({
    super.key,
    required this.comments,
  });

  final List<CommentModel> comments;

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
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
                horizontal: appDefaultPadding, vertical: appDefaultPadding / 2),
            itemCount: comments.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: appDefaultPadding / 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 10,
                          backgroundImage: NetworkImage(
                            'https://i.pinimg.com/736x/b2/96/3b/b2963b8409faf5db6a20a5b2d1246125.jpg',
                          ),
                        ),
                        const SizedBox(width: appDefaultPadding / 2),
                        const Text(
                          'Chansy Thor',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: appDefaultPadding),
                        Text(
                          formateDate(comment.createdAt),
                          style: const TextStyle(
                            color: greyColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: appDefaultPadding / 2,
                      ),
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
                      child: Text(comment.comment),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
