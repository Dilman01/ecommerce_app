import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        spacing: 16.h,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.cartEmptyIcon,
            height: 240.h,
            width: 240.w,
            fit: BoxFit.cover,
          ),
          Text('Your cart is empty', style: context.appTextTheme.heading2Bold),
          Text(
            'Looks like you have not added anything in your cart. Go ahead and explore top categories.',
            style: context.appTextTheme.body2Regular,
          ),
          SizedBox(height: 8.h),
          CustomButton(
            onPressed: () {
              context.goNamed(RouteNames.categories);
            },
            title: 'Explore Categories',
          ),
        ],
      ),
    );
  }
}
