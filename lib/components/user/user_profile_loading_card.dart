import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../configs/config.dart';

class ProfileLoading extends StatelessWidget {
  const ProfileLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: greyColor.shade100,
      highlightColor: greyColor.shade300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(appDefaultPadding),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: greyColor.shade100,
                ),
                const SizedBox(width: appDefaultPadding),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 14,
                      width: 120,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                    ),
                    const SizedBox(height: appDefaultPadding / 2),
                    Container(
                      height: 14,
                      width: 80,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                    ),
                    const SizedBox(height: appDefaultPadding),
                    Container(
                      height: 14,
                      width: 120,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                    ),
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
                    Container(
                      height: 14,
                      width: 60,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                    ),
                    const SizedBox(height: appDefaultPadding / 4),
                    Container(
                      height: 14,
                      width: 60,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 14,
                      width: 60,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                    ),
                    const SizedBox(height: appDefaultPadding / 4),
                    Container(
                      height: 14,
                      width: 60,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 14,
                      width: 60,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                    ),
                    const SizedBox(height: appDefaultPadding / 4),
                    Container(
                      height: 14,
                      width: 60,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 14,
                      width: 60,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                    ),
                    const SizedBox(height: appDefaultPadding / 4),
                    Container(
                      height: 14,
                      width: 60,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
