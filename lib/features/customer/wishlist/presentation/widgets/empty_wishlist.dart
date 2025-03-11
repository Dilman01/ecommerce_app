import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({super.key});

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
            AppImages.wishlistEmptyIcon,
            height: 240.h,
            width: 240.w,
            fit: BoxFit.cover,
          ),
          Text(
            'Your wishlist is empty',
            style: context.appTextTheme.heading2Bold,
          ),
          Text(
            'Tap heart button to start saving your favorite items.',
            textAlign: TextAlign.center,
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
