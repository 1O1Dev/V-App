import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../configs/config.dart';
import '../component.dart';

class CommentLoading extends StatelessWidget {
  const CommentLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: appDefaultPadding,
        vertical: appDefaultPadding / 2,
      ),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: greyColor.shade100,
          highlightColor: greyColor.shade300,
          child: const CommentLoadingCard(),
        );
      },
    );
  }
}
