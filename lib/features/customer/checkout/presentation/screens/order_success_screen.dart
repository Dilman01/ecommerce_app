import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          spacing: 16.h,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 408.h,
              width: 328.w,
              decoration: BoxDecoration(
                color: context.appColors.cyan50,
                borderRadius: BorderRadius.circular(32).r,
              ),
              child: Center(
                child: Image.asset(
                  AppImages.orderSuccessImage,
                  height: 240.h,
                  width: 240.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Your order has been placed successfully',
              textAlign: TextAlign.center,
              style: context.appTextTheme.heading2Bold,
            ),
            Text(
              'Thank you for choosing us! Feel free to continue shopping and explore our wide range of products. Happy Shopping!',
              textAlign: TextAlign.center,
              style: context.appTextTheme.body2Regular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
            SizedBox(height: 8.h),
            CustomButton(
              onPressed: () {
                while (context.canPop()) {
                  context.pop();
                }
                context.goNamed(RouteNames.home);
              },
              title: 'Continue Shopping',
            ),
          ],
        ),
      ),
    );
  }
}
