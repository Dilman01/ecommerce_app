import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/tab_bar_widget.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order History', style: context.appTextTheme.body2Medium),
          bottom: PreferredSize(
            preferredSize: Size(328.w, 80.h),

            child: TabBarWidget(),
          ),
        ),

        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 28.h),
                Image.asset(
                  AppImages.orderHistoryImage,
                  height: 240.h,
                  width: 240.w,
                  fit: BoxFit.cover,
                ),
                Text(
                  'No ongoing order',
                  textAlign: TextAlign.center,
                  style: context.appTextTheme.heading2Bold,
                ),
                SizedBox(height: 16.h),
                Text(
                  'We currently don\'t have any active orders in progress. Feel free to explore our products and place a new order.',
                  textAlign: TextAlign.center,
                  style: context.appTextTheme.body2Regular.copyWith(
                    color: context.appColors.grey150,
                  ),
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  onPressed: () {
                    context.goNamed(RouteNames.categories);
                  },
                  title: 'Explore Categories',
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 28.h),
                Image.asset(
                  AppImages.orderHistoryImage,
                  height: 240.h,
                  width: 240.w,
                  fit: BoxFit.cover,
                ),
                Text(
                  'No completed order',
                  textAlign: TextAlign.center,
                  style: context.appTextTheme.heading2Bold,
                ),
                SizedBox(height: 16.h),
                Text(
                  'We don\'t have any past orders that have been completed. Start shopping now and create your first order with us.',
                  textAlign: TextAlign.center,
                  style: context.appTextTheme.body2Regular.copyWith(
                    color: context.appColors.grey150,
                  ),
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  onPressed: () {
                    context.goNamed(RouteNames.categories);
                  },
                  title: 'Explore Categories',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
