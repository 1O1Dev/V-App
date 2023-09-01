import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:v_app/services/like_service.dart';
import '../../configs/config.dart';

class PostActionButton extends StatelessWidget {
  final String postId;
  const PostActionButton({
    Key? key,
    required this.postId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    onLike() async {
      bool isLike = await LikeServices().likePost(postId);
      if (isLike) {
        print("Your like this post");
      } else {
        print("Your can not like this post");
      }
    }

    return Row(
      children: [
        const SizedBox(width: 50),
        InkWell(
          onTap: () => onLike(),
          borderRadius: BorderRadius.circular(appDefaultBorderRadius * 2),
          child: SizedBox(
            height: 40,
            width: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
            height: 40,
            width: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/comment.svg',
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(appDefaultBorderRadius * 2),
          child: SizedBox(
            height: 40,
            width: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/repost.svg',
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(appDefaultBorderRadius * 2),
          child: SizedBox(
            height: 40,
            width: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/share.svg',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
