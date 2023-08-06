import 'package:flutter/material.dart';
import 'package:v_app/models/model.dart';
import '../../configs/config.dart';
import '../component.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);
  final PostModel post;

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
              ProfileAndPostTitle(post: post),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: post.post.files.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    left: 60,
                    right: appDefaultPadding / 2,
                  ),
                  itemBuilder: (context, index) {
                    final file = post.post.files[index];
                    return ImageCard(file: file);
                  },
                ),
              ),
              const SizedBox(height: appDefaultPadding / 2),
              const PostActionButton(),
              RepliesAndLikes(
                threePeople: post.threePeople,
                count: post.count,
                postId: post.post.id,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
