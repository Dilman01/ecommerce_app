import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class ReviewContent extends StatelessWidget {
  const ReviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 18.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shipping Address', style: context.appTextTheme.body1Medium),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Full Name',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
            Text(
              'Dilman Arif',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Mobile Number',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
            Text(
              '123456789',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'City',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
            Text(
              'Erbil',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Street Address',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
            Text(
              'XYZ Address',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Postal Code',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
            Text(
              '123',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
          ],
        ),
        Divider(color: context.appColors.grey50, height: 0, thickness: 1),
        Text('Order Info', style: context.appTextTheme.body1Medium),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
            Text(
              '\$0.00',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Cost',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
            Text(
              '\$0.00',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: context.appTextTheme.body1Medium),
            Text('\$0.00', style: context.appTextTheme.body1Medium),
          ],
        ),
        SizedBox(height: 56.h),
      ],
    );
  }
}
