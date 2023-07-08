import 'package:flutter/material.dart';

class Setting {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  Setting({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}

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
    onTap: () {},
  ),
];
