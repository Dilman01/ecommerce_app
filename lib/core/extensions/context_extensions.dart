import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/style/theme/color_extension.dart';

extension ContextExt on BuildContext {
  MyColors get appColors => Theme.of(this).extension<MyColors>()!;
}
