import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class TableCellTitle extends StatelessWidget {
  const TableCellTitle({required this.icon, required this.title, super.key});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 8.h),
      child: Row(
        spacing: 4.w,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: context.appColors.arrowColor, size: 20.r),
          Text(title, style: context.appTextTheme.body2Medium),
        ],
      ),
    );
  }
}
