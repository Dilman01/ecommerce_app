import 'package:flutter/material.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet {
  const CustomBottomSheet._();

  static void showModalBottomSheetContainer({
    required BuildContext context,
    required Widget widget,
    Color? backgroundColor,
    VoidCallback? whenComplete,
  }) => showModalBottomSheet<dynamic>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    context: context,
    backgroundColor: backgroundColor ?? context.appColors.backgroundColor,
    isScrollControlled: true,
    builder: (context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(padding: const EdgeInsets.all(16).r, child: widget),
        ),
      );
    },
  ).whenComplete(whenComplete ?? () {});
}
