import 'package:flutter/material.dart';

import 'package:ecommerce_app/core/style/colors/app_colors.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/core/style/theme/app_typography.dart';
import 'package:ecommerce_app/core/style/theme/assets_extension.dart';
import 'package:ecommerce_app/core/style/theme/color_extension.dart';
import 'package:ecommerce_app/core/style/theme/text_extension.dart';

abstract class AppTheme {
  static final light = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.white,
      scrolledUnderElevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.cyan,
      unselectedItemColor: AppColors.grey150Light,
      enableFeedback: false,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: AppColors.cyan),
      unselectedIconTheme: IconThemeData(color: AppColors.grey150Light),
      unselectedLabelStyle: AppTypography.captionRegular.copyWith(
        color: AppColors.grey150Light,
      ),
      selectedLabelStyle: AppTypography.captionSemiBold.copyWith(
        color: AppColors.black,
      ),
      elevation: 0.5,
    ),
    scaffoldBackgroundColor: AppColors.white,
    extensions: [_lightAppColors, _lightTextTheme, _lightAssets],
  );

  static final dark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.black,
      scrolledUnderElevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
      selectedItemColor: AppColors.cyan,
      unselectedItemColor: AppColors.grey150Dark,
      enableFeedback: false,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: AppColors.cyan),
      unselectedIconTheme: IconThemeData(color: AppColors.grey150Light),
      unselectedLabelStyle: AppTypography.captionRegular.copyWith(
        color: AppColors.grey150Light,
      ),
      selectedLabelStyle: AppTypography.captionSemiBold.copyWith(
        color: AppColors.white,
      ),
      elevation: 0.5,
    ),
    scaffoldBackgroundColor: AppColors.black,
    extensions: [_darkAppColors, _darkTextTheme, _darkAssets],
  );

  static final _lightTextTheme = AppTextThemeExt(
    heading1Bold: AppTypography.heading1Bold.copyWith(color: AppColors.black),
    heading1SemiBold: AppTypography.heading1SemiBold.copyWith(
      color: AppColors.black,
    ),
    heading1Regular: AppTypography.heading1Regular.copyWith(
      color: AppColors.black,
    ),
    heading2Bold: AppTypography.heading2Bold.copyWith(color: AppColors.black),
    heading2SemiBold: AppTypography.heading2SemiBold.copyWith(
      color: AppColors.black,
    ),
    heading2Regular: AppTypography.heading2Regular.copyWith(
      color: AppColors.black,
    ),
    heading3Bold: AppTypography.heading3Bold.copyWith(color: AppColors.black),
    heading3SemiBold: AppTypography.heading3SemiBold.copyWith(
      color: AppColors.black,
    ),
    heading3Regular: AppTypography.heading3Regular.copyWith(
      color: AppColors.black,
    ),
    button1SemiBold: AppTypography.button1SemiBold.copyWith(
      color: AppColors.black,
    ),
    button2SemiBold: AppTypography.button2SemiBold.copyWith(
      color: AppColors.black,
    ),
    body1Medium: AppTypography.body1Medium.copyWith(color: AppColors.black),
    body1Regular: AppTypography.body1Regular.copyWith(color: AppColors.black),
    body2Medium: AppTypography.body2Medium.copyWith(color: AppColors.black),
    body2Regular: AppTypography.body2Regular.copyWith(color: AppColors.black),
    captionSemiBold: AppTypography.captionSemiBold.copyWith(
      color: AppColors.black,
    ),
    captionRegular: AppTypography.captionRegular.copyWith(
      color: AppColors.black,
    ),
    overlineSemiBold: AppTypography.overlineSemiBold.copyWith(
      color: AppColors.black,
    ),
    overlineRegular: AppTypography.overlineRegular.copyWith(
      color: AppColors.black,
    ),
  );

  static final _darkTextTheme = AppTextThemeExt(
    heading1Bold: AppTypography.heading1Bold.copyWith(color: AppColors.white),
    heading1SemiBold: AppTypography.heading1SemiBold.copyWith(
      color: AppColors.white,
    ),
    heading1Regular: AppTypography.heading1Regular.copyWith(
      color: AppColors.white,
    ),
    heading2Bold: AppTypography.heading2Bold.copyWith(color: AppColors.white),
    heading2SemiBold: AppTypography.heading2SemiBold.copyWith(
      color: AppColors.white,
    ),
    heading2Regular: AppTypography.heading2Regular.copyWith(
      color: AppColors.white,
    ),
    heading3Bold: AppTypography.heading3Bold.copyWith(color: AppColors.white),
    heading3SemiBold: AppTypography.heading3SemiBold.copyWith(
      color: AppColors.white,
    ),
    heading3Regular: AppTypography.heading3Regular.copyWith(
      color: AppColors.white,
    ),
    button1SemiBold: AppTypography.button1SemiBold.copyWith(
      color: AppColors.white,
    ),
    button2SemiBold: AppTypography.button2SemiBold.copyWith(
      color: AppColors.white,
    ),
    body1Medium: AppTypography.body1Medium.copyWith(color: AppColors.white),
    body1Regular: AppTypography.body1Regular.copyWith(color: AppColors.white),
    body2Medium: AppTypography.body2Medium.copyWith(color: AppColors.white),
    body2Regular: AppTypography.body2Regular.copyWith(color: AppColors.white),
    captionSemiBold: AppTypography.captionSemiBold.copyWith(
      color: AppColors.white,
    ),
    captionRegular: AppTypography.captionRegular.copyWith(
      color: AppColors.white,
    ),
    overlineSemiBold: AppTypography.overlineSemiBold.copyWith(
      color: AppColors.white,
    ),
    overlineRegular: AppTypography.overlineRegular.copyWith(
      color: AppColors.white,
    ),
  );

  static const _lightAppColors = MyColors(
    primaryColor: AppColors.cyan,
    backgroundColor: AppColors.white,
    navIconBorderColor: AppColors.grey150Light,
    buttonBgColor: AppColors.black,
    favButtonBgColor: AppColors.black,
    arrowColor: AppColors.black,
    buttonTextColor: AppColors.black,
    dynamicWhiteOrBlack: AppColors.white,
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
    arrowColor: AppColors.white,
    buttonTextColor: AppColors.cyan,
    dynamicWhiteOrBlack: AppColors.black,
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

  static const MyAssets _lightAssets = MyAssets(
    appIcon: AppImages.quickMartIconLight,
    arrowBack: AppImages.arrowBackLight,
    searchIcon: AppImages.searchIconLight,
  );

  static const MyAssets _darkAssets = MyAssets(
    appIcon: AppImages.quickMartIconDark,
    arrowBack: AppImages.arrowBackDark,
    searchIcon: AppImages.searchIconDark,
  );
}
