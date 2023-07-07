import 'package:flutter/material.dart';
import '../../configs/config.dart';
import '../component.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Post vertical line
        Positioned(
          top: 65,
          left: 35,
          bottom: 45,
          child: Container(
            color: greyColor.shade200,
            width: 2,
          ),
        ),
        // Post Details
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.5,
                color: greyColor.shade300,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileAndPostTitle(),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    left: 60,
                    right: appDefaultPadding / 2,
                  ),
                  itemBuilder: (context, index) => const ImageCard(),
                ),
              ),
              const SizedBox(height: appDefaultPadding / 2),
              const PostActionButton(),
              const RepliesAndLikes(),
            ],
          ),
        ),
      ],
    );
  }
}
