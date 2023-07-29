import 'package:flutter/material.dart';
import '../../configs/config.dart';
import '../../models/model.dart';
import '../../utils/util.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    required this.user,
  });

  final UserModelOne user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(appDefaultPadding),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.user.profileImage),
              ),
              const SizedBox(width: appDefaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user.user.name} ${user.user.lastName}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "@${user.user.name}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: greyColor,
                    ),
                  ),
                  const SizedBox(height: appDefaultPadding / 2),
                  Text(user.user.email),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(appDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    formatNumber(user.count.followingCount),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: appDefaultPadding / 4),
                  const Text(
                    "Following",
                    style: TextStyle(
                      fontSize: 12,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    formatNumber(user.count.repliesCount),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: appDefaultPadding / 4),
                  const Text(
                    "Replies",
                    style: TextStyle(
                      fontSize: 12,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    formatNumber(user.count.likesCount),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: appDefaultPadding / 4),
                  const Text(
                    "Like",
                    style: TextStyle(
                      fontSize: 12,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    formatNumber(user.count.sharesCount),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: appDefaultPadding / 4),
                  const Text(
                    "Share",
                    style: TextStyle(
                      fontSize: 12,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
