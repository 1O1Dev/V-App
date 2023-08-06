import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:v_app/configs/app_config.dart';

class PostErrorCard extends StatelessWidget {
  final VoidCallback onTap;
  const PostErrorCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset("assets/icons/error.json"),
        const Text(
          "Oops!, Error",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: appDefaultPadding),
        const Text(
          "Something went wrong",
          style: TextStyle(color: greyColor),
        ),
        const Text(
          "Please try again",
          style: TextStyle(color: greyColor),
        ),
        const SizedBox(height: appDefaultPadding * 4),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(appDefaultBorderRadius),
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: appColor,
              borderRadius: BorderRadius.circular(appDefaultBorderRadius),
            ),
            alignment: Alignment.center,
            child: const Text(
              "RETRY",
              style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
