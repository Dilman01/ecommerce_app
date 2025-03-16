import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/app/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/common/widgets/no_internet.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/features/customer/home/presentation/bloc/latest_products_bloc.dart';
import 'package:ecommerce_app/features/customer/home/presentation/widgets/carousel_widget.dart';
import 'package:ecommerce_app/features/customer/home/presentation/widgets/categories_list.dart';
import 'package:ecommerce_app/features/customer/home/presentation/widgets/home_app_bar.dart';
import 'package:ecommerce_app/features/customer/home/presentation/widgets/latest_products_list.dart';
import 'package:ecommerce_app/features/customer/home/presentation/widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: HomeAppBar(), centerTitle: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
          builder: (context, state) {
            if (state is InternetConnectionConnected) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 24.h,
                      children: [
                        CarouselWidget(),
                        SectionHeader(
                          onTap: () {
                            context.goNamed(RouteNames.categories);
                          },
                          title: 'Categories',
                        ),
                        CategoriesList(),
                        BlocBuilder<LatestProductsBloc, LatestProductsState>(
                          builder: (context, state) {
                            if (state is LatestProductsLoading) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: context.appColors.cyan,
                                ),
                              );
                            }
                            if (state is LatestProductsFailure) {
                              return Center(child: Text(state.message));
                            }
                            if (state is LatestProductsLoaded) {
                              if (state.products.isEmpty) {
                                return Center(
                                  child: Text(
                                    'No Products here!',
                                    style: context.appTextTheme.body2Medium,
                                  ),
                                );
                              }
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SectionHeader(
                                    onTap: () {
                                      context.pushNamed(
                                        RouteNames.productsList,
                                        pathParameters: {
                                          'title': 'Latest Products',
                                        },
                                        extra: state.products,
                                      );
                                    },
                                    title: 'Latest Products',
                                  ),
                                  SizedBox(height: 24.h),
                                  LatestProductsList(products: state.products),
                                  SizedBox(height: 12.h),
                                  CustomButton(
                                    onPressed: () {
                                      context.pushNamed(
                                        RouteNames.productsList,
                                        pathParameters: {
                                          'title': 'Latest Products',
                                        },
                                        extra: state.products,
                                      );
                                    },
                                    title: 'View All',
                                  ),
                                  SizedBox(height: 12.h),
                                ],
                              );
                            }
                            return SizedBox();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is InternetConnectionDisconnected) {
              return NoInternet();
            } else {
              return Center(
                child: CircularProgressIndicator(color: context.appColors.cyan),
              );
            }
          },
        ),
      ),
    );
  }
}
