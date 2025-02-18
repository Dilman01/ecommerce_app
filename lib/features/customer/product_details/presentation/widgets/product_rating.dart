import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3.w,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.star, size: 10.r, color: context.appColors.merigold),
        Icon(Icons.star, size: 10.r, color: context.appColors.merigold),
        Icon(Icons.star, size: 10.r, color: context.appColors.merigold),
        Icon(Icons.star, size: 10.r, color: context.appColors.merigold),
        Icon(Icons.star_half, size: 10.r, color: context.appColors.merigold),
        Text(
          '4.5 (2,495 reviews)',
          style: context.appTextTheme.overlineSemiBold,
        ),
      ],
    );
  }
}
