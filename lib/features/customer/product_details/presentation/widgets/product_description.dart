import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      description,
      style: context.appTextTheme.body2Regular.copyWith(
        color: context.appColors.grey150,
      ),
      trimLines: 5,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read more',
      trimExpandedText: '\nShow less',
      lessStyle: context.appTextTheme.body2Regular.copyWith(
        color: context.appColors.cyan.withValues(alpha: 0.6),
      ),
      moreStyle: context.appTextTheme.body2Regular.copyWith(
        color: context.appColors.cyan,
      ),
    );
  }
}
