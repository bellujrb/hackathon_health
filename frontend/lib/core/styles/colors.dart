import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static AppColors? _instance;

  static AppColors get instance {
    _instance ??= AppColors._();
    return _instance!;
  }

  static Color get primary => const Color(0xFF2EB5FA);
  static Color get onPrimary => const Color(0xFF332B3A);
  static Color get secondary => const Color(0xFF4B5563);
  static Color get tertiary => const Color(0xFFFFFFFF);
  static Color get onTertiary => const Color(0xFFF3F4F6);
}
