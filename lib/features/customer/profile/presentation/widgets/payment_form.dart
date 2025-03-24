import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/custom_text_field.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 8.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 64.h,
              width: 145.w,
              decoration: BoxDecoration(
                color: context.appColors.cyan50,
                borderRadius: BorderRadius.circular(12).r,
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppImages.paypalIcon,
                  height: 17.h,
                  width: 62.w,
                ),
              ),
            ),
            Container(
              height: 64.h,
              width: 145.w,
              decoration: BoxDecoration(
                color: context.appColors.cyan50,
                borderRadius: BorderRadius.circular(12).r,
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppImages.googlePayIcon,
                  height: 17.h,
                  width: 62.w,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        const CustomTextField(
          title: 'Card Holder Name',
          hintText: 'Enter card holder name',
        ),
        const CustomTextField(title: 'Card Number', hintText: '4111 1111 1111 1111'),
        Row(
          spacing: 8.w,
          children: [
            CustomTextField(
              title: 'Expiration',
              hintText: 'MM/YY',
              width: 145.w,
            ),
            CustomTextField(title: 'CVV', hintText: '123', width: 145.w),
          ],
        ),
      ],
    );
  }
}
