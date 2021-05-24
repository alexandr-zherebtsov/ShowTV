import 'package:flutter/material.dart';
import 'package:show_tv/common/colors.dart';

class AppThemeData {
  static final ThemeData appTheme = ThemeData(
    brightness: AppColors.brightnessDark,
    accentColor: AppColors.colorWhite,
    scaffoldBackgroundColor: AppColors.colorBlue_1,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.colorBlue_2,
      selectedItemColor: AppColors.colorWhite,
      unselectedItemColor: AppColors.colorWhite,
      selectedIconTheme: const IconThemeData(
        color: AppColors.colorWhite,
        size: 29.0,
      ),
      unselectedIconTheme: const IconThemeData(
        color: AppColors.colorWhite,
        size: 27.0,
      ),
      selectedLabelStyle: const TextStyle(
        color: AppColors.colorWhite,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      ),
      unselectedLabelStyle: const TextStyle(
        color: AppColors.colorWhite,
        fontWeight: FontWeight.w400,
        fontSize: 13.0,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      color: AppColors.colorBlue_2,
      titleTextStyle: const TextStyle(
        color: AppColors.colorWhite,
        fontSize: 21.0,
      ),
    ),
    textTheme: TextTheme(
      headline1: const TextStyle(
        color: AppColors.colorWhite,
        fontWeight: FontWeight.w500,
        fontSize: 32.0,
      ),
      headline2: const TextStyle(
        color: AppColors.colorWhite,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      ),
      caption: const TextStyle(
        color: AppColors.colorWhite,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      ),
    ),
  );
}
