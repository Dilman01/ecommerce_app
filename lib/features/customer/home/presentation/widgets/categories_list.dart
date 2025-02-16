import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:go_router/go_router.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.pushNamed(RouteNames.category);
            },
            borderRadius: BorderRadius.circular(12).r,
            child: Container(
              width: 94.w,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12).r,
                border: Border.all(color: context.appColors.grey50),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('📱', style: context.appTextTheme.heading2Bold),
                  Text(
                    'Electronics',
                    overflow: TextOverflow.ellipsis,
                    style: context.appTextTheme.overlineSemiBold,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
