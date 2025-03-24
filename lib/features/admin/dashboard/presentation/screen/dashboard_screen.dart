import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_app/core/common/app/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:ecommerce_app/core/common/widgets/no_internet.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/blocs/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:ecommerce_app/features/admin/users/presentation/blocs/get_all_users/get_all_users_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
        builder: (context, state) {
          if (state is InternetConnectionConnected) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<GetAllAdminProductsBloc>().add(
                  const FetchAllAdminProducts(isLoading: true),
                );
                context.read<GetAllAdminCategoriesBloc>().add(
                  const FetchAllCategories(isLoading: true),
                );
                context.read<GetAllUsersBloc>().add(
                  const FetchAllUsersEvent(isLoading: true),
                );
              },
              color: context.appColors.cyan,
              backgroundColor: context.appColors.backgroundColor,
              child: ListView(
                children: [
                  BlocBuilder<
                    GetAllAdminProductsBloc,
                    GetAllAdminProductsState
                  >(
                    builder: (context, state) {
                      if (state is GetAllAdminProductsSuccess) {
                        return Container(
                          height: 130.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16).r,
                            border: Border.all(color: context.appColors.grey50),
                            color: context.appColors.backgroundColor,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                spacing: 25.h,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Products',
                                    style: context.appTextTheme.heading2Bold,
                                  ),
                                  Text(
                                    '${state.products.length}',
                                    style: context.appTextTheme.heading2Bold,
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                AppImages.cartIconSelected,
                                height: 80.h,
                                width: 80.w,
                                colorFilter: ColorFilter.mode(
                                  context.appColors.arrowColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return Container(
                        height: 130.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16).r,
                          border: Border.all(color: context.appColors.grey50),
                          color: context.appColors.backgroundColor,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: context.appColors.cyan,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  BlocBuilder<
                    GetAllAdminCategoriesBloc,
                    GetAllAdminCategoriesState
                  >(
                    builder: (context, state) {
                      if (state is GetAllAdminCategoriesSuccess) {
                        return Container(
                          height: 130.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16).r,
                            border: Border.all(color: context.appColors.grey50),
                            color: context.appColors.backgroundColor,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                spacing: 25.h,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Categories',
                                    style: context.appTextTheme.heading2Bold,
                                  ),
                                  Text(
                                    '${state.categories.length}',
                                    style: context.appTextTheme.heading2Bold,
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                AppImages.categoriesIconSelected,
                                height: 80.h,
                                width: 80.w,
                                colorFilter: ColorFilter.mode(
                                  context.appColors.arrowColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return Container(
                        height: 130.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16).r,
                          border: Border.all(color: context.appColors.grey50),
                          color: context.appColors.backgroundColor,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: context.appColors.cyan,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
                    builder: (context, state) {
                      if (state is GetAllUsersSuccess) {
                        return Container(
                          height: 130.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16).r,
                            border: Border.all(color: context.appColors.grey50),
                            color: context.appColors.backgroundColor,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                spacing: 25.h,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Users',
                                    style: context.appTextTheme.heading2Bold,
                                  ),
                                  Text(
                                    '${state.users.length}',
                                    style: context.appTextTheme.heading2Bold,
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                AppImages.profileIconSelected,
                                height: 80.h,
                                width: 80.w,
                                colorFilter: ColorFilter.mode(
                                  context.appColors.arrowColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return Container(
                        height: 130.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16).r,
                          border: Border.all(color: context.appColors.grey50),
                          color: context.appColors.backgroundColor,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: context.appColors.cyan,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state is InternetConnectionDisconnected) {
            return const NoInternet();
          } else {
            return Center(
              child: CircularProgressIndicator(color: context.appColors.cyan),
            );
          }
        },
      ),
    );
  }
}
