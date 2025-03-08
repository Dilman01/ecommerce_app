import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.title, required this.price});

  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 255.w,
          child: Text(
            title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: context.appTextTheme.heading3Bold,
          ),
        ),
        Text('\$$price', style: context.appTextTheme.heading3Bold),
      ],
    );
  }
}
