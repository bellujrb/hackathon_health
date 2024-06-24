import 'package:flutter/material.dart';
import 'package:frontend/core/styles/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static AppTextStyles? _instance;

  static AppTextStyles get instance {
    _instance ??= AppTextStyles._();
    return _instance!;
  }

  TextStyle get smallWhite => TextStyle(
      color: AppColors.tertiary,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  TextStyle get smallBlack => TextStyle(
      color: AppColors.onPrimary,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  TextStyle get mediumBlack => TextStyle(
      color: AppColors.onPrimary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none);

  TextStyle get smallGray => TextStyle(
      color: AppColors.secondary,
      fontSize: 15.5,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);
}

extension AppTextStylesExtension on BuildContext {
  AppTextStyles get appTextStyles => AppTextStyles.instance;
}
