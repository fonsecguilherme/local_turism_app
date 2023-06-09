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
}
