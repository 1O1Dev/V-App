import 'package:flutter/material.dart';
import 'package:v_app/configs/config.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // useMaterial3: true,
    scaffoldBackgroundColor: whiteColor,
    primaryColor: appColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      centerTitle: false,
      elevation: 0.0,
      actionsIconTheme: IconThemeData(
        color: blackColor,
        size: 18,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: whiteColor,
      unselectedLabelColor: greyColor,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      indicator: BoxDecoration(
        color: appColor,
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: whiteColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: whiteColor,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: appColor,
        size: 30,
      ),
      unselectedIconTheme: IconThemeData(
        color: greyColor,
        size: 30,
      ),
      type: BottomNavigationBarType.fixed,
    ),
  );
}
