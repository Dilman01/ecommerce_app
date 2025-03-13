import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/profile_app_bar.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/setting_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      backgroundColor: context.appColors.cyan,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 4.h),
        padding: EdgeInsets.symmetric(vertical: 24.h),
        decoration: BoxDecoration(
          color: context.appColors.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24).r,
            topRight: Radius.circular(24).r,
          ),
        ),

        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Personal Information',
                style: context.appTextTheme.captionSemiBold,
              ),
            ),
            SizedBox(height: 25.h),
            SettingItem(
              onTap: () {
                context.pushNamed(RouteNames.shipping);
              },
              title: 'Shipping Address',
              iconPath: AppImages.shippingIcon,
            ),
            SizedBox(height: 14.h),
            SettingItem(
              onTap: () {
                context.pushNamed(RouteNames.payment);
              },
              title: 'Payment Method',
              iconPath: AppImages.paymentIcon,
            ),
            SizedBox(height: 14.h),
            SettingItem(
              onTap: () {},
              title: 'Order History',
              iconPath: AppImages.orderHistoryIcon,
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Support & Information',
                style: context.appTextTheme.captionSemiBold,
              ),
            ),
            SizedBox(height: 25.h),
            SettingItem(
              onTap: () {},
              title: 'Privacy Policy',
              iconPath: AppImages.privacyIcon,
            ),
            SizedBox(height: 14.h),
            SettingItem(
              onTap: () {},
              title: 'Terms & Conditions',
              iconPath: AppImages.termsIcon,
            ),
            SizedBox(height: 14.h),
            SettingItem(
              onTap: () {},
              title: 'FAQs',
              iconPath: AppImages.faqsIcon,
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Account Management',
                style: context.appTextTheme.captionSemiBold,
              ),
            ),
            SizedBox(height: 25.h),
            SettingItem(
              onTap: () {},
              title: 'Change Password',
              iconPath: AppImages.changePasswordIcon,
            ),
            SizedBox(height: 14.h),
            SettingItem(
              onTap: () {},
              isThemeToggle: true,
              title: 'Dark Theme',
              iconPath: AppImages.themeIcon,
            ),
          ],
        ),
      ),
    );
  }
}
