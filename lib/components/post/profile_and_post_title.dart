import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:v_app/models/model.dart';
import 'package:v_app/pages/page.dart';
import 'package:v_app/utils/util.dart';
import '../../configs/config.dart';

class ProfileAndPostTitle extends StatelessWidget {
  const ProfileAndPostTitle({
    Key? key,
    required this.post,
  }) : super(key: key);
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(
          left: appDefaultPadding,
          top: appDefaultPadding,
          right: appDefaultPadding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
              width: 45,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FriendProfilePage(userId: post.user.id),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(
                      appDefaultBorderRadius * 2,
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(post.user.profileImage),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: blackColor,
                        border: Border.all(color: whiteColor),
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: whiteColor,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: appDefaultPadding / 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: appDefaultPadding / 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FriendProfilePage(userId: post.user.id),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "${post.user.name} ${post.user.lastName}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: appDefaultPadding / 2),
                            const Icon(
                              Icons.verified,
                              color: blueColor,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            formateDate(post.post.createdAt),
                            style: const TextStyle(
                              color: greyColor,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: appDefaultPadding),
                          InkWell(
                            onTap: () {
                              showProfileAction(context);
                            },
                            borderRadius:
                                BorderRadius.circular(appDefaultBorderRadius),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    appDefaultBorderRadius),
                              ),
                              child: const Icon(Icons.more_horiz),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: appDefaultPadding / 4),
                  Text(post.post.title),
                  const SizedBox(height: appDefaultPadding),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showProfileAction(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      barrierColor: blackColor.withOpacity(0.4),
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: 220,
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(appDefaultBorderRadius),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: appDefaultPadding),
        child: Column(
          children: [
            Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                color: greyColor.shade300,
                borderRadius: BorderRadius.circular(appDefaultBorderRadius),
              ),
              margin: const EdgeInsets.all(appDefaultPadding / 2),
            ),
            const SizedBox(height: appDefaultPadding / 2),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(appDefaultBorderRadius),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: greyColor.shade100,
                  borderRadius: BorderRadius.circular(appDefaultBorderRadius),
                ),
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: appDefaultPadding),
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.volumeXmark, size: 16),
                    SizedBox(width: appDefaultPadding),
                    Text(
                      'Mute',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: appDefaultPadding),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: greyColor.shade100,
                borderRadius: BorderRadius.circular(appDefaultBorderRadius),
              ),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(
                        appDefaultBorderRadius,
                      ),
                    ),
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: greyColor.shade200),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: appDefaultPadding),
                      child: const Row(
                        children: [
                          FaIcon(FontAwesomeIcons.eyeSlash, size: 16),
                          SizedBox(width: appDefaultPadding),
                          Text(
                            'Hide',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: greyColor.shade200),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: appDefaultPadding),
                      child: const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.ban,
                            size: 16,
                            color: redColor,
                          ),
                          SizedBox(width: appDefaultPadding),
                          Text(
                            'Block',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: redColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(
                        appDefaultBorderRadius,
                      ),
                    ),
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: appDefaultPadding),
                      child: const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.bug,
                            size: 16,
                            color: redColor,
                          ),
                          SizedBox(width: appDefaultPadding),
                          Text(
                            'Report',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: redColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
