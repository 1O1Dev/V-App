import 'package:flutter/material.dart';
import 'package:v_app/configs/app_config.dart';

import '../page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/564x/f0/82/2e/f0822eea56a4765019741ba64f704846.jpg',
                    ),
                  ),
                ),
                Positioned(
                  top: appDefaultPadding * 5,
                  right: appDefaultPadding,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/e3/35/87/e335877470ec1f731eb737fede2e311b.jpg',
                    ),
                  ),
                ),
                Positioned(
                  top: appDefaultPadding * 15,
                  right: -50,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/8b/2b/07/8b2b071a1c9abe181055a10043a6f7f8.jpg',
                    ),
                  ),
                ),
                Positioned(
                  top: appDefaultPadding * 30,
                  right: -50,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/d1/6f/5f/d16f5f20ddf55e164b9e6739e09c6b86.jpg',
                    ),
                  ),
                ),
                Positioned(
                  top: appDefaultPadding * 10,
                  left: -70,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/a6/39/35/a63935b6306ed76699661de0acb6a42f.jpg',
                    ),
                  ),
                ),
                Positioned(
                  top: appDefaultPadding * 8,
                  left: appDefaultPadding * 8,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/564x/a5/d1/1a/a5d11a420cb0bf3f06e0a5b2ace867c2.jpg',
                    ),
                  ),
                ),
                Positioned(
                  top: appDefaultPadding * 22,
                  left: appDefaultPadding * 5,
                  child: CircleAvatar(
                    radius: 120,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/f9/5f/b3/f95fb3b5b6eda21f587f6ba93995dbcd.jpg',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(appDefaultPadding * 2),
            child: const Column(
              children: [
                Text(
                  "Find your first meta matches.",
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: appDefaultPadding),
                Text(
                  "Join us and socialize with millions of meta humans",
                  // textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(appDefaultPadding * 2),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppPage(),
                          ),
                        ),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.all(appDefaultPadding),
                          decoration: BoxDecoration(
                            color: blackColor,
                            borderRadius:
                                BorderRadius.circular(appDefaultBorderRadius),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Get started",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: appDefaultPadding),
                              Icon(
                                Icons.arrow_outward_sharp,
                                color: whiteColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: appDefaultPadding),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                      child: const Icon(
                        Icons.apple,
                      ),
                    ),
                    const SizedBox(width: appDefaultPadding),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: greyColor.shade100,
                        borderRadius:
                            BorderRadius.circular(appDefaultBorderRadius),
                      ),
                      child: const Icon(
                        Icons.facebook,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: appDefaultPadding * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: greyColor),
                    ),
                    const SizedBox(width: appDefaultPadding / 2),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: appColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: appDefaultPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
