import 'package:flutter/material.dart';
import '../../configs/config.dart';

class CommentLoadingCard extends StatelessWidget {
  const CommentLoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: appDefaultPadding / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: greyColor.shade100,
              ),
              const SizedBox(width: appDefaultPadding / 2),
              Container(
                height: 14,
                width: 120,
                decoration: BoxDecoration(
                  color: greyColor.shade100,
                  borderRadius: BorderRadius.circular(appDefaultBorderRadius),
                ),
              ),
              const SizedBox(width: appDefaultPadding),
              Container(
                height: 14,
                width: 60,
                decoration: BoxDecoration(
                  color: greyColor.shade100,
                  borderRadius: BorderRadius.circular(appDefaultBorderRadius),
                ),
              ),
            ],
          ),
          const SizedBox(height: appDefaultPadding / 4),
          Container(
            height: 14,
            width: double.infinity,
            decoration: BoxDecoration(
              color: greyColor.shade100,
              borderRadius: BorderRadius.circular(appDefaultBorderRadius),
            ),
          ),
          const SizedBox(height: appDefaultPadding / 4),
          Container(
            height: 14,
            width: double.infinity,
            decoration: BoxDecoration(
              color: greyColor.shade100,
              borderRadius: BorderRadius.circular(appDefaultBorderRadius),
            ),
          ),
          const SizedBox(height: appDefaultPadding / 4),
          Container(
            height: 14,
            width: 120,
            decoration: BoxDecoration(
              color: greyColor.shade100,
              borderRadius: BorderRadius.circular(appDefaultBorderRadius),
            ),
          ),
          const SizedBox(height: appDefaultPadding / 2),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
              left: appDefaultPadding,
            ),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  vertical: appDefaultPadding / 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: greyColor.shade100,
                        ),
                        const SizedBox(width: appDefaultPadding / 2),
                        Container(
                          height: 14,
                          width: 60,
                          decoration: BoxDecoration(
                            color: greyColor.shade100,
                            borderRadius:
                                BorderRadius.circular(appDefaultBorderRadius),
                          ),
                        ),
                        const SizedBox(width: appDefaultPadding),
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
                    const SizedBox(height: appDefaultPadding / 4),
                    Container(
                      height: 14,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                    ),
                    const SizedBox(height: appDefaultPadding / 4),
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
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
