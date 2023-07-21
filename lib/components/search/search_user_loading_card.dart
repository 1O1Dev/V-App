import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../configs/config.dart';

class SearchUserLoadingCard extends StatelessWidget {
  const SearchUserLoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: greyColor.shade100,
      highlightColor: greyColor.shade300,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: appDefaultPadding,
          vertical: appDefaultPadding / 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(backgroundColor: greyColor.shade100),
            const SizedBox(width: appDefaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 14,
                    width: 160,
                    decoration: BoxDecoration(
                      color: greyColor.shade100,
                      borderRadius: BorderRadius.circular(
                        appDefaultBorderRadius,
                      ),
                    ),
                  ),
                  const SizedBox(height: appDefaultPadding / 4),
                  Container(
                    height: 12,
                    width: 200,
                    decoration: BoxDecoration(
                      color: greyColor.shade100,
                      borderRadius: BorderRadius.circular(
                        appDefaultBorderRadius,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                color: greyColor.shade100,
                borderRadius: BorderRadius.circular(
                  appDefaultBorderRadius,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
