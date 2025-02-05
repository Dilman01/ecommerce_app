import 'package:flutter/material.dart';

class MyAssets extends ThemeExtension<MyAssets> {
  const MyAssets({
    required this.appIcon,
    required this.arrowBack,
  });
  final String appIcon;
  final String arrowBack;

  @override
  ThemeExtension<MyAssets> copyWith({
    String? appIcon,
    String? arrowBack,
  }) {
    return MyAssets(
      appIcon: appIcon ?? this.appIcon,
      arrowBack: arrowBack ?? this.arrowBack,
    );
  }

  @override
  ThemeExtension<MyAssets> lerp(covariant ThemeExtension<MyAssets>? other, double t) {
    return MyAssets(
      appIcon: appIcon,
      arrowBack: arrowBack,
    );
  }
}
