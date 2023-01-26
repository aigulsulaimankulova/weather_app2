import 'package:flutter/material.dart';
import 'package:weather_app2/constants/app_colors.dart';

class AppTextStyle {
  static const TextStyle appBarStyle = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle body1 =
      TextStyle(color: AppColors.white, fontSize: 95);

  static const TextStyle body2 =
      TextStyle(color: AppColors.white, fontSize: 60);

  static const TextStyle city = TextStyle(color: AppColors.white, fontSize: 50);
}
