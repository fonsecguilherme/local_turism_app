import 'package:flutter/material.dart';
import 'package:local_turism/style/app_colors.dart';

class Style {
  static ThemeData appTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
    ),
  );

  static const appBarTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const bannerCityNameStyle = TextStyle(
    color: AppColors.white,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static const bannerCityDescriptionStyle = TextStyle(
    color: AppColors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const tagStyle = TextStyle(
    color: AppColors.black,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
}
