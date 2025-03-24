import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/app/theme_cubit/theme_cubit.dart';
import 'package:ecommerce_app/core/di/init_dependencies.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/screen/admin_categories_screen.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/blocs/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/screen/admin_products_screen.dart';
import 'package:ecommerce_app/features/admin/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:ecommerce_app/features/admin/home/presentation/widget/profile_header.dart';
import 'package:ecommerce_app/features/admin/users/presentation/blocs/get_all_users/get_all_users_bloc.dart';
import 'package:ecommerce_app/features/admin/users/presentation/screen/users_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  Widget currentScreen = DashboardScreen();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  sl<GetAllAdminCategoriesBloc>()
                    ..add(FetchAllCategories(isLoading: true)),
        ),
        BlocProvider(
          create:
              (context) =>
                  sl<GetAllAdminProductsBloc>()
                    ..add(FetchAllAdminProducts(isLoading: true)),
        ),
        BlocProvider(
          create:
              (context) =>
                  sl<GetAllUsersBloc>()
                    ..add(FetchAllUsersEvent(isLoading: true)),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(context.assets.appIcon, height: 32.h),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu, size: 32.r),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          backgroundColor: context.appColors.backgroundColor,
          child: Column(
            spacing: 20.h,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileHeader(),
              ListTile(
                title: Text(
                  'Dashboard',
                  style: context.appTextTheme.heading3SemiBold,
                ),
                leading: Icon(
                  Icons.dashboard_outlined,
                  color: context.appColors.arrowColor,
                  size: 32.r,
                ),
                onTap: () {
                  setState(() {
                    currentScreen = DashboardScreen();
                  });
                  context.pop();
                },
              ),
              ListTile(
                title: Text(
                  'Categories',
                  style: context.appTextTheme.heading3SemiBold,
                ),
                leading: SvgPicture.asset(
                  AppImages.categoriesIconUnselected,
                  height: 32.h,
                  width: 32.w,
                  colorFilter: ColorFilter.mode(
                    context.appColors.arrowColor,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {
                  setState(() {
                    currentScreen = AdminCategoriesScreen();
                  });
                  context.pop();
                },
              ),
              ListTile(
                title: Text(
                  'Products',
                  style: context.appTextTheme.heading3SemiBold,
                ),
                leading: SvgPicture.asset(
                  AppImages.cartIconUnselected,
                  height: 32.h,
                  width: 32.w,
                  colorFilter: ColorFilter.mode(
                    context.appColors.arrowColor,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {
                  setState(() {
                    currentScreen = AdminProductsScreen();
                  });
                  context.pop();
                },
              ),
              ListTile(
                title: Text(
                  'Users',
                  style: context.appTextTheme.heading3SemiBold,
                ),
                leading: Icon(
                  Icons.people_alt_outlined,
                  color: context.appColors.arrowColor,
                  size: 32.r,
                ),
                onTap: () {
                  setState(() {
                    currentScreen = UsersScreen();
                  });
                  context.pop();
                },
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: context.appTextTheme.heading3SemiBold,
                ),
                leading: SvgPicture.asset(
                  AppImages.logoutIcon,
                  height: 32.h,
                  width: 32.w,
                  colorFilter: ColorFilter.mode(
                    context.appColors.arrowColor,
                    BlendMode.srcIn,
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: context.appColors.backgroundColor,
                        title: Text(
                          'Logout',
                          style: context.appTextTheme.heading3SemiBold,
                        ),
                        content: Text(
                          'Are you sure you want to logout?',
                          style: context.appTextTheme.body2Regular,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text(
                              'Cancel',
                              style: context.appTextTheme.button1SemiBold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(AuthLogout());
                              context.pop();
                              context.pushReplacementNamed(RouteNames.login);
                            },
                            child: Text(
                              'Logout',
                              style: context.appTextTheme.button1SemiBold
                                  .copyWith(color: context.appColors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              Spacer(),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                    icon: Icon(
                      context.read<ThemeCubit>().state.themeMode ==
                              ThemeMode.light
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,

                      color: context.appColors.arrowColor,
                      size: 40.r,
                    ),
                  ),
                  Text(
                    context.read<ThemeCubit>().state.themeMode ==
                            ThemeMode.light
                        ? 'Light'
                        : 'Dark',
                    style: context.appTextTheme.heading3SemiBold,
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
        body: currentScreen,
      ),
    );
  }
}
