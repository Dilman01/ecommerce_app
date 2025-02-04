import 'package:ecommerce_app/core/style/colors/app_colors.dart';
import 'package:ecommerce_app/core/style/theme/color_extension.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.white,
    extensions: [
      _lightAppColors,
    ],
  );

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.black,
    extensions: [
      _darkAppColors,
    ],
  );

  static const _lightAppColors = MyColors(
    primaryColor: AppColors.cyan,
    backgroundColor: AppColors.white,
    navIconBorderColor: AppColors.grey150Light,
    buttonBgColor: AppColors.black,
    favButtonBgColor: AppColors.black,
    cyan: AppColors.cyan,
    cyan50: AppColors.cyan50Light,
    black: AppColors.black,
    white: AppColors.white,
    grey50: AppColors.grey50Light,
    grey100: AppColors.grey100,
    grey150: AppColors.grey150Light,
    red: AppColors.red,
    green: AppColors.green,
    blue: AppColors.blue,
    purple: AppColors.purple,
    yellow: AppColors.yellow,
    orange: AppColors.orange,
    merigold: AppColors.merigold,
    brown: AppColors.brown,
    pink: AppColors.pink,
  );

  static const _darkAppColors = MyColors(
    primaryColor: AppColors.cyan,
    backgroundColor: AppColors.black,
    navIconBorderColor: AppColors.grey150Light,
    buttonBgColor: AppColors.cyan,
    favButtonBgColor: AppColors.white,
    cyan: AppColors.cyan,
    cyan50: AppColors.cyan50Dark,
    black: AppColors.black,
    white: AppColors.white,
    grey50: AppColors.grey50Dark,
    grey100: AppColors.grey100,
    grey150: AppColors.grey150Dark,
    red: AppColors.red,
    green: AppColors.green,
    blue: AppColors.blue,
    purple: AppColors.purple,
    yellow: AppColors.yellow,
    orange: AppColors.orange,
    merigold: AppColors.merigold,
    brown: AppColors.brown,
    pink: AppColors.pink,
  );
}
