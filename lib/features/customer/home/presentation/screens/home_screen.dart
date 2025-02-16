import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/features/customer/home/presentation/widgets/carousel_widget.dart';
import 'package:ecommerce_app/features/customer/home/presentation/widgets/categories_list.dart';
import 'package:ecommerce_app/features/customer/home/presentation/widgets/latest_products_list.dart';
import 'package:ecommerce_app/features/customer/home/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/features/customer/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: HomeAppBar(), centerTitle: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 24.h,
                children: [
                  CarouselWidget(),
                  SectionHeader(
                    onTap: () {
                      context.goNamed(RouteNames.category);
                    },
                    title: 'Categories',
                  ),
                  CategoriesList(),
                  SectionHeader(onTap: () {}, title: 'Lates Products'),
                  LatestProductsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
