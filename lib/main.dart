import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_app/configs/config.dart';
import 'package:v_app/pages/page.dart';

void main() {
  runApp(const ProviderScope(child: VApp()));
}

class VApp extends StatelessWidget {
  const VApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      // This work only android
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: greyColor.shade100,
        ),
      );
    }
    SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: appName,
      theme: AppTheme.lightTheme,
      home: const AppPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
