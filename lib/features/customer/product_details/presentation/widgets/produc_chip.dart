import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class ProductChip extends StatelessWidget {
  const ProductChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6.w,
      children: [
        Container(
          height: 24.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8).r,
            color: context.appColors.blue,
          ),
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
          child: Text(
            'Top Rated',
            style: context.appTextTheme.overlineSemiBold.copyWith(
              color: context.appColors.dynamicWhiteOrBlack,
            ),
          ),
        ),
        Container(
          height: 24.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8).r,
            color: context.appColors.green,
          ),
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
          child: Text(
            'Free Shipping',
            style: context.appTextTheme.overlineSemiBold.copyWith(
              color: context.appColors.dynamicWhiteOrBlack,
            ),
          ),
        ),
      ],
    );
  }
}
