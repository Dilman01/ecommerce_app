import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: context.appTextTheme.body2Medium),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 8.w,
          childAspectRatio: 160 / 100,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.pushNamed(
                RouteNames.productsList,
                pathParameters: {'title': 'Electronics'},
              );
            },
            borderRadius: BorderRadius.circular(16).r,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16).r,
                border: Border.all(color: context.appColors.grey50),
              ),
              child: Column(
                spacing: 2.h,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('📱', style: context.appTextTheme.heading1Bold),
                  Text(
                    'Electronics',
                    overflow: TextOverflow.ellipsis,
                    style: context.appTextTheme.captionSemiBold,
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
