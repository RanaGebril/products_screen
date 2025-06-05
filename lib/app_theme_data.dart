import 'package:flutter/material.dart';

import 'App_colors.dart';

class AppThemeData {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white_color,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.blue_color1,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),

      displayMedium: TextStyle(
        color: AppColors.blue_color1,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),

      displaySmall: TextStyle(
        color: AppColors.blue_color3,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.lineThrough,
        decorationColor: AppColors.blue_color3,
      ),
    ),
  );
}
