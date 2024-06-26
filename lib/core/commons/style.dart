import 'package:flutter/material.dart';
import 'package:local_turism/core/commons/app_colors.dart';

class Style {
  static ThemeData appTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
    ),
    fontFamily: 'Poppins',
  );

  static const appBarTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const appBarTemperatureTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
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
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const textStyleBlackFont = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const cityDetailTitleStyleSemiBold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const cityDetailTitleStyleBold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const cityDetailDescriptionStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
}
