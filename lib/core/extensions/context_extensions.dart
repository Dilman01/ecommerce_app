import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/style/theme/assets_extension.dart';
import 'package:ecommerce_app/core/style/theme/text_extension.dart';
import 'package:ecommerce_app/core/style/theme/color_extension.dart';

extension ContextExt on BuildContext {
  MyColors get appColors => Theme.of(this).extension<MyColors>()!;

  MyAssets get assets => Theme.of(this).extension<MyAssets>()!;

  AppTextThemeExt get appTextTheme => Theme.of(this).extension<AppTextThemeExt>()!;
}
