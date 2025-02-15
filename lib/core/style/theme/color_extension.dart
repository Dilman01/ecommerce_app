import 'package:flutter/material.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.primaryColor,
    required this.backgroundColor,
    required this.navIconBorderColor,
    required this.buttonBgColor,
    required this.favButtonBgColor,
    required this.arrowColor,
    required this.buttonTextColor,
    required this.cyan,
    required this.cyan50,
    required this.black,
    required this.white,
    required this.grey50,
    required this.grey100,
    required this.grey150,
    required this.red,
    required this.green,
    required this.blue,
    required this.purple,
    required this.yellow,
    required this.orange,
    required this.merigold,
    required this.brown,
    required this.pink,
  });

  final Color primaryColor;
  final Color backgroundColor;
  final Color navIconBorderColor;
  final Color buttonBgColor;
  final Color favButtonBgColor;
  final Color arrowColor;
  final Color buttonTextColor;
  final Color cyan;
  final Color cyan50;
  final Color black;
  final Color white;
  final Color grey50;
  final Color grey100;
  final Color grey150;
  final Color red;
  final Color green;
  final Color blue;
  final Color purple;
  final Color yellow;
  final Color orange;
  final Color merigold;
  final Color brown;
  final Color pink;

  @override
  ThemeExtension<MyColors> copyWith({
    Color? primaryColor,
    Color? backgroundColor,
    Color? navIconBorderColor,
    Color? buttonBgColor,
    Color? favButtonBgColor,
    Color? arrowColor,
    Color? buttonTextColor,
    Color? cyan,
    Color? cyan50,
    Color? black,
    Color? white,
    Color? grey50,
    Color? grey100,
    Color? grey150,
    Color? red,
    Color? green,
    Color? blue,
    Color? purple,
    Color? yellow,
    Color? orange,
    Color? merigold,
    Color? brown,
    Color? pink,
  }) {
    return MyColors(
      primaryColor: primaryColor ?? this.primaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      navIconBorderColor: navIconBorderColor ?? this.navIconBorderColor,
      buttonBgColor: buttonBgColor ?? this.buttonBgColor,
      favButtonBgColor: favButtonBgColor ?? this.favButtonBgColor,
      arrowColor: arrowColor ?? this.arrowColor,
      buttonTextColor: buttonBgColor ?? this.buttonBgColor,
      cyan: cyan ?? this.cyan,
      cyan50: cyan50 ?? this.cyan50,
      black: black ?? this.black,
      white: white ?? this.white,
      grey50: grey50 ?? this.grey50,
      grey100: grey100 ?? this.grey100,
      grey150: grey150 ?? this.grey150,
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      purple: purple ?? this.purple,
      yellow: yellow ?? this.yellow,
      orange: orange ?? this.orange,
      merigold: merigold ?? this.merigold,
      brown: brown ?? this.brown,
      pink: pink ?? this.pink,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    return MyColors(
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      navIconBorderColor: navIconBorderColor,
      buttonBgColor: buttonBgColor,
      favButtonBgColor: favButtonBgColor,
      arrowColor: arrowColor,
      buttonTextColor: buttonBgColor,
      cyan: cyan,
      cyan50: cyan50,
      black: black,
      white: white,
      grey50: grey50,
      grey100: grey100,
      grey150: grey150,
      red: red,
      green: green,
      blue: blue,
      purple: purple,
      yellow: yellow,
      orange: orange,
      merigold: merigold,
      brown: brown,
      pink: pink,
    );
  }
}
