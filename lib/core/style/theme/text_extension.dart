import 'package:flutter/material.dart';

class AppTextThemeExt extends ThemeExtension<AppTextThemeExt> {
  const AppTextThemeExt({
    required this.heading1Bold,
    required this.heading1SemiBold,
    required this.heading1Regular,
    required this.heading2Bold,
    required this.heading2SemiBold,
    required this.heading2Regular,
    required this.heading3Bold,
    required this.heading3SemiBold,
    required this.heading3Regular,
    required this.button1SemiBold,
    required this.button2SemiBold,
    required this.body1Medium,
    required this.body1Regular,
    required this.body2Medium,
    required this.body2Regular,
    required this.captionSemiBold,
    required this.captionRegular,
    required this.overlineSemiBold,
    required this.overlineRegular,
  });

  final TextStyle heading1Bold;
  final TextStyle heading1SemiBold;
  final TextStyle heading1Regular;
  final TextStyle heading2Bold;
  final TextStyle heading2SemiBold;
  final TextStyle heading2Regular;
  final TextStyle heading3Bold;
  final TextStyle heading3SemiBold;
  final TextStyle heading3Regular;
  final TextStyle button1SemiBold;
  final TextStyle button2SemiBold;
  final TextStyle body1Medium;
  final TextStyle body1Regular;
  final TextStyle body2Medium;
  final TextStyle body2Regular;
  final TextStyle captionSemiBold;
  final TextStyle captionRegular;
  final TextStyle overlineSemiBold;
  final TextStyle overlineRegular;

  @override
  ThemeExtension<AppTextThemeExt> copyWith({
    TextStyle? heading1Bold,
    TextStyle? heading1SemiBold,
    TextStyle? heading1Regular,
    TextStyle? heading2Bold,
    TextStyle? heading2SemiBold,
    TextStyle? heading2Regular,
    TextStyle? heading3Bold,
    TextStyle? heading3SemiBold,
    TextStyle? heading3Regular,
    TextStyle? button1SemiBold,
    TextStyle? button2SemiBold,
    TextStyle? body1Medium,
    TextStyle? body1Regular,
    TextStyle? body2Medium,
    TextStyle? body2Regular,
    TextStyle? captionSemiBold,
    TextStyle? captionRegular,
    TextStyle? overlineSemiBold,
    TextStyle? overlineRegular,
  }) {
    return AppTextThemeExt(
      heading1Bold: heading1Bold ?? this.heading1Bold,
      heading1SemiBold: heading1SemiBold ?? this.heading1SemiBold,
      heading1Regular: heading1Regular ?? this.heading1Regular,
      heading2Bold: heading2Bold ?? this.heading2Bold,
      heading2SemiBold: heading2SemiBold ?? this.heading2SemiBold,
      heading2Regular: heading2Regular ?? this.heading2Regular,
      heading3Bold: heading3Bold ?? this.heading3Bold,
      heading3SemiBold: heading3SemiBold ?? this.heading3SemiBold,
      heading3Regular: heading3Regular ?? this.heading3Regular,
      button1SemiBold: button1SemiBold ?? this.button1SemiBold,
      button2SemiBold: button2SemiBold ?? this.button2SemiBold,
      body1Medium: body1Medium ?? this.body1Medium,
      body1Regular: body1Regular ?? this.body1Regular,
      body2Medium: body2Medium ?? this.body2Medium,
      body2Regular: body2Regular ?? this.body2Regular,
      captionSemiBold: captionSemiBold ?? this.captionSemiBold,
      captionRegular: captionRegular ?? this.captionRegular,
      overlineSemiBold: overlineSemiBold ?? this.overlineSemiBold,
      overlineRegular: overlineRegular ?? this.overlineRegular,
    );
  }

  @override
  ThemeExtension<AppTextThemeExt> lerp(covariant ThemeExtension<AppTextThemeExt>? other, double t) {
    return AppTextThemeExt(
      heading1Bold: heading1Bold,
      heading1SemiBold: heading1SemiBold,
      heading1Regular: heading1Regular,
      heading2Bold: heading2Bold,
      heading2SemiBold: heading2SemiBold,
      heading2Regular: heading2Regular,
      heading3Bold: heading3Bold,
      heading3SemiBold: heading3SemiBold,
      heading3Regular: heading3Regular,
      button1SemiBold: button1SemiBold,
      button2SemiBold: button2SemiBold,
      body1Medium: body1Medium,
      body1Regular: body1Regular,
      body2Medium: body2Medium,
      body2Regular: body2Regular,
      captionSemiBold: captionSemiBold,
      captionRegular: captionRegular,
      overlineSemiBold: overlineSemiBold,
      overlineRegular: overlineRegular,
    );
  }
}
