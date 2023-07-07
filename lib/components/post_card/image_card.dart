import 'package:flutter/material.dart';
import '../../configs/config.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      margin: const EdgeInsets.only(right: appDefaultPadding / 2),
      decoration: BoxDecoration(
        color: greyColor.shade100,
        borderRadius: BorderRadius.circular(appDefaultBorderRadius),
        border: Border.all(color: greyColor.shade200),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(appDefaultBorderRadius),
        child: Image.network(
          'https://i.pinimg.com/564x/25/81/43/258143bbcb9ec277043fb92ff57eac7d.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
