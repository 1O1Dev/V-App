import 'package:flutter/material.dart';
import 'package:v_app/configs/app_config.dart';
import 'package:v_app/models/model.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
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
