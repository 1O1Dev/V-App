import 'package:flutter/material.dart';
import '../../configs/config.dart';
import '../../models/user.dart';
import '../../utils/util.dart';

class SearchUserCard extends StatelessWidget {
  const SearchUserCard({
    Key? key,
    required this.user,
    required this.follower,
    required this.onTap,
  }) : super(key: key);

  final UserModel user;
  final int follower;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: greyColor.shade100,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: appDefaultPadding,
          vertical: appDefaultPadding / 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                user.profileImage,
              ),
            ),
            const SizedBox(width: appDefaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user.name} ${user.lastName}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: appDefaultPadding / 4),
                  Text(
                    follower != 0
                        ? "${formatNumber(follower)} followers"
                        : 'No followers',
                    style: const TextStyle(
                      fontSize: 12,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(appDefaultBorderRadius),
              child: Container(
                height: 30,
                padding: const EdgeInsets.symmetric(
                  horizontal: appDefaultPadding,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor.shade200),
                  borderRadius: BorderRadius.circular(appDefaultBorderRadius),
                ),
                child: const Text('Follow'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
