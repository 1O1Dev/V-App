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
      toolbarHeight: 45,
      titleTextStyle: TextStyle(
        color: blackColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: IconThemeData(
        color: blackColor,
        size: 18,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: whiteColor,
      unselectedLabelColor: greyColor,
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      labelPadding:
          const EdgeInsets.symmetric(horizontal: appDefaultPadding / 1.2),
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
      showSelectedLabels: false,
      showUnselectedLabels: false,
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
