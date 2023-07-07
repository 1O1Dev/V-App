import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:v_app/configs/app_config.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage>
    with AutomaticKeepAliveClientMixin {
  final String contentText =
      "although if a height or width is specified on the SvgPicture, a SizedBox will be used instead (which ensures better layout experience). There is currently no way to show an Error visually, however errors will get properly logged to the console in debug mode.";

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: greyColor.shade300,
                  ),
                ),
              ),
              padding: const EdgeInsets.all(appDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: Stack(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://i.pinimg.com/564x/68/77/ef/6877ef663699d383f2e80b9bc355a220.jpg',
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
                                  borderRadius: BorderRadius.circular(
                                      appDefaultBorderRadius),
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
                      const SizedBox(width: appDefaultPadding),
                      // Post content and action
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: appDefaultPadding / 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      "Chansy",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.verified,
                                      color: blueColor,
                                      size: 14,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "40m",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: greyColor,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      borderRadius: BorderRadius.circular(
                                          appDefaultBorderRadius),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: appDefaultPadding / 2),
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
                            Text(contentText),
                            const SizedBox(height: appDefaultPadding),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(appDefaultBorderRadius),
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                color: greyColor.shade100,
                                child: Image.network(
                                  'https://i.pinimg.com/564x/25/81/43/258143bbcb9ec277043fb92ff57eac7d.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: appDefaultPadding / 2),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(
                                      appDefaultBorderRadius * 2),
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
                                  borderRadius: BorderRadius.circular(
                                      appDefaultBorderRadius * 2),
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
                                  borderRadius: BorderRadius.circular(
                                      appDefaultBorderRadius * 2),
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
                                  borderRadius: BorderRadius.circular(
                                      appDefaultBorderRadius * 2),
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: appDefaultPadding / 2),
                  // People replies and likes
                  Row(
                    children: [
                      SizedBox(
                        height: 16,
                        child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => const CircleAvatar(
                            radius: 8,
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
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 65,
              left: 35,
              bottom: 45,
              child: Container(
                color: greyColor.shade200,
                width: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
