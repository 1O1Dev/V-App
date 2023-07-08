import 'package:flutter/material.dart';
import '../../configs/config.dart';

class RepliesAndLikes extends StatelessWidget {
  const RepliesAndLikes({super.key});

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
          SizedBox(
            width: appDefaultPadding,
            child: CircleAvatar(
              radius: 2,
              backgroundColor: greyColor.shade300,
            ),
          ),
          const Text(
            '11 replies',
            style: TextStyle(color: greyColor, fontSize: 12),
          ),
          SizedBox(
            width: appDefaultPadding,
            child: CircleAvatar(
              radius: 2,
              backgroundColor: greyColor.shade300,
            ),
          ),
          const Text(
            '42 likes',
            style: TextStyle(color: greyColor, fontSize: 12),
          ),
          SizedBox(
            width: appDefaultPadding,
            child: CircleAvatar(
              radius: 2,
              backgroundColor: greyColor.shade300,
            ),
          ),
          const Text(
            '42 shares',
            style: TextStyle(color: greyColor, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
