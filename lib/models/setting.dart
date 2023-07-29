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
