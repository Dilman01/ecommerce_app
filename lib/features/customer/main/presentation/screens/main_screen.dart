import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/di/init_dependencies.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/customer/category/presentation/blocs/categories_bloc/categories_bloc.dart';
import 'package:ecommerce_app/features/customer/home/presentation/bloc/latest_products_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _goToBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<CategoriesBloc>()..add(GetAllCategories()),
        ),
        // BlocProvider(create: (context) => sl<GetProductsByCategoryBloc>()),
        BlocProvider(
          create:
              (context) => sl<LatestProductsBloc>()..add(GetLatestProducts()),
        ),
      ],
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
          child: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: _goToBranch,
            useLegacyColorScheme: false,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.homeIconUnselected,
                  height: 24.h,
                  width: 24.w,
                ),
                activeIcon: SvgPicture.asset(
                  AppImages.homeIconSelected,
                  height: 24.h,
                  width: 24.w,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.categoriesIconUnselected,
                  height: 24.h,
                  width: 24.w,
                ),
                activeIcon: SvgPicture.asset(
                  AppImages.categoriesIconSelected,
                  height: 24.h,
                  width: 24.w,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.cartIconUnselected,
                  height: 24.h,
                  width: 24.w,
                ),
                activeIcon: SvgPicture.asset(
                  AppImages.cartIconSelected,
                  height: 24.h,
                  width: 24.w,
                ),
                label: 'My Cart',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.wishlistIconUnselected,
                  height: 24.h,
                  width: 24.w,
                ),
                activeIcon: SvgPicture.asset(
                  AppImages.wishlistIconSelected,
                  height: 24.h,
                  width: 24.w,
                ),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.profileIconUnselected,
                  height: 24.h,
                  width: 24.w,
                ),
                activeIcon: SvgPicture.asset(
                  AppImages.profileIconSelected,
                  height: 24.h,
                  width: 24.w,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
