import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:v_app/configs/app_config.dart';
import 'package:v_app/models/model.dart';
import 'package:v_app/pages/page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    List<Setting> settings = [
      Setting(
        icon: Icons.person_add_alt,
        title: 'Follow and invite friend',
        onTap: () {},
      ),
      Setting(
        icon: Icons.notifications_none_rounded,
        title: 'Notification',
        onTap: () {},
      ),
      Setting(
        icon: Icons.lock_open_outlined,
        title: 'Privacy',
        onTap: () {},
      ),
      Setting(
        icon: Icons.account_circle_outlined,
        title: 'Account',
        onTap: () {},
      ),
      Setting(
        icon: Icons.language,
        title: 'Language',
        onTap: () {},
      ),
      Setting(
        icon: Icons.health_and_safety_outlined,
        title: 'Help',
        onTap: () {},
      ),
      Setting(
        icon: Icons.help_outline_rounded,
        title: 'About',
        onTap: () {},
      ),
      Setting(
        icon: Icons.logout_outlined,
        title: 'Logout',
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: SizedBox(
                height: 400,
                width: 300,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 330,
                        width: 300,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius:
                              BorderRadius.circular(appDefaultBorderRadius),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 100),
                            const Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Log Out",
                                    style: TextStyle(
                                      color: appColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: appDefaultPadding),
                                  Text(
                                    "Are you sure to log out?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: greyColor),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              ),
                              borderRadius: BorderRadius.circular(
                                appDefaultBorderRadius * 2,
                              ),
                              child: Container(
                                height: 45,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.circular(
                                    appDefaultBorderRadius * 2,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Yes, I am',
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: appDefaultPadding),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: SizedBox(
                        height: 170,
                        width: 170,
                        child: Lottie.network(
                          'https://lottie.host/69b64364-4a53-428e-8136-8ef4aa7177e5/9Br8lk2dfU.json',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          splashRadius: 18,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: blackColor,
            size: 20,
          ),
        ),
        title: const Text('Settings'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: settings.length,
        itemBuilder: (context, index) {
          final setting = settings[index];
          return ListTile(
            onTap: setting.onTap,
            splashColor: greyColor.shade100,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: appDefaultPadding,
            ),
            minLeadingWidth: appDefaultPadding,
            leading: Icon(setting.icon, color: blackColor),
            title: Text(
              setting.title,
              style: const TextStyle(color: blackColor),
            ),
          );
        },
      ),
    );
  }
}
