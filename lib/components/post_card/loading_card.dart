import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../configs/config.dart';

class PostLoadingCard extends StatelessWidget {
  const PostLoadingCard({
    Key? key,
  }) : super(key: key);

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
            color: greyColor.shade100,
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
          child: Shimmer.fromColors(
            baseColor: greyColor.shade100,
            highlightColor: greyColor.shade300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile
                Container(
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
                            CircleAvatar(backgroundColor: greyColor.shade100),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: greyColor.shade100,
                                  border: Border.all(color: whiteColor),
                                  borderRadius: BorderRadius.circular(
                                    appDefaultBorderRadius,
                                  ),
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
                                Row(
                                  children: [
                                    Container(
                                      height: 14,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: greyColor.shade100,
                                        borderRadius: BorderRadius.circular(
                                          appDefaultBorderRadius,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        width: appDefaultPadding / 2),
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: greyColor.shade100,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 14,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: greyColor.shade100,
                                        borderRadius: BorderRadius.circular(
                                          appDefaultBorderRadius,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: appDefaultPadding),
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: greyColor.shade100,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: appDefaultPadding),
                            // Post title
                            Container(
                              height: 14,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: greyColor.shade100,
                                borderRadius: BorderRadius.circular(
                                  appDefaultBorderRadius,
                                ),
                              ),
                            ),
                            const SizedBox(height: appDefaultPadding / 2),
                            Container(
                              height: 14,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: greyColor.shade100,
                                borderRadius: BorderRadius.circular(
                                  appDefaultBorderRadius,
                                ),
                              ),
                            ),
                            const SizedBox(height: appDefaultPadding / 2),
                            Container(
                              height: 14,
                              width: 80,
                              decoration: BoxDecoration(
                                color: greyColor.shade100,
                                borderRadius: BorderRadius.circular(
                                  appDefaultBorderRadius,
                                ),
                              ),
                            ),
                            const SizedBox(height: appDefaultPadding),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                    itemBuilder: (context, index) => Container(
                      height: 240,
                      width: 220,
                      margin: const EdgeInsets.symmetric(
                        horizontal: appDefaultPadding / 2,
                      ),
                      decoration: BoxDecoration(
                        color: greyColor.shade200,
                        borderRadius: BorderRadius.circular(
                          appDefaultBorderRadius,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: appDefaultPadding / 2),
                // Post action
                Row(
                  children: [
                    const SizedBox(width: 55),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(appDefaultPadding / 2),
                        child: CircleAvatar(
                          backgroundColor: greyColor.shade100,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(appDefaultPadding / 2),
                        child: CircleAvatar(
                          backgroundColor: greyColor.shade100,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(appDefaultPadding / 2),
                        child: CircleAvatar(
                          backgroundColor: greyColor.shade100,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(appDefaultPadding / 2),
                        child: CircleAvatar(
                          backgroundColor: greyColor.shade100,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(appDefaultPadding),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 16,
                        child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CircleAvatar(
                            radius: 7,
                            backgroundColor: greyColor.shade100,
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
                      Container(
                        height: 14,
                        width: 50,
                        decoration: BoxDecoration(
                          color: greyColor.shade100,
                          borderRadius: BorderRadius.circular(
                            appDefaultBorderRadius,
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
                      Container(
                        height: 14,
                        width: 50,
                        decoration: BoxDecoration(
                          color: greyColor.shade100,
                          borderRadius: BorderRadius.circular(
                            appDefaultBorderRadius,
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
                      Container(
                        height: 14,
                        width: 50,
                        decoration: BoxDecoration(
                          color: greyColor.shade100,
                          borderRadius: BorderRadius.circular(
                            appDefaultBorderRadius,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
