import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/config.dart';

class PostActionButton extends StatelessWidget {
  const PostActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 50),
        InkWell(
          onTap: () {},
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
