import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/tab_item.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: context.appColors.grey50,
        borderRadius: BorderRadius.circular(12).r,
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        splashBorderRadius: BorderRadius.circular(12).r,
        onTap: (value) {
          setState(() {
            tabIndex = value;
          });
        },
        tabs: [
          TabItem(title: 'Ongoing', isSelected: tabIndex == 0),
          TabItem(title: 'Completed', isSelected: tabIndex == 1),
        ],
      ),
    );
  }
}
