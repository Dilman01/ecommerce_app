import 'package:flutter/material.dart';

class MyAssets extends ThemeExtension<MyAssets> {
  const MyAssets({
    required this.appIcon,
    required this.arrowBack,
    required this.searchIcon,
  });
  final String appIcon;
  final String arrowBack;
  final String searchIcon;

  @override
  ThemeExtension<MyAssets> copyWith({
    String? appIcon,
    String? arrowBack,
    String? searchIcon,
  }) {
    return MyAssets(
      appIcon: appIcon ?? this.appIcon,
      arrowBack: arrowBack ?? this.arrowBack,
      searchIcon: searchIcon ?? this.searchIcon,
    );
  }

  @override
  ThemeExtension<MyAssets> lerp(
    covariant ThemeExtension<MyAssets>? other,
    double t,
  ) {
    return MyAssets(
      appIcon: appIcon,
      arrowBack: arrowBack,
      searchIcon: searchIcon,
    );
  }
}
