import 'package:flutter/material.dart';
import 'package:v_app/models/model.dart';
import '../../configs/config.dart';
import '../component.dart';

class RepliesAndLikes extends StatelessWidget {
  final List<UserModel> threePeople;
  final CountModel count;
  final String postId;
  const RepliesAndLikes({
    Key? key,
    required this.threePeople,
    required this.count,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(appDefaultPadding),
      child: Row(
        children: [
          threePeople.isNotEmpty
              ? Container(
                  height: 16,
                  width: 45,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemCount: threePeople.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CircleAvatar(
                      radius: 7,
                      backgroundImage: NetworkImage(
                        threePeople[index].profileImage,
                      ),
                    ),
                  ),
                )
              : Container(width: 45),
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
                          builder: (context) => CommentPost(postId: postId),
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
