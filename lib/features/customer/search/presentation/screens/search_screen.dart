import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/app/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:ecommerce_app/core/common/widgets/no_internet.dart';
import 'package:ecommerce_app/core/di/init_dependencies.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/customer/search/presentation/bloc/search_products_bloc.dart';
import 'package:ecommerce_app/features/customer/search/presentation/widgets/search_products_list.dart';
import 'package:ecommerce_app/features/customer/search/presentation/widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchProductsBloc>(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(context.assets.appIcon, height: 32.h),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.close, size: 32.r),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    SearchTextField(),
                    SizedBox(height: 16.h),

                    BlocBuilder<
                      InternetConnectionCubit,
                      InternetConnectionState
                    >(
                      builder: (context, state) {
                        if (state is InternetConnectionConnected) {
                          return BlocBuilder<
                            SearchProductsBloc,
                            SearchProductsState
                          >(
                            builder: (context, state) {
                              if (state is SearchProductsLoading) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: context.appColors.cyan,
                                  ),
                                );
                              }

                              if (state is SearchProductsFailure) {
                                return Center(
                                  child: Text(
                                    state.message,
                                    style: context.appTextTheme.body1Medium,
                                  ),
                                );
                              }

                              if (state is SearchProductsSuccess) {
                                if (state.products.isEmpty) {
                                  return Center(
                                    child: Text(
                                      'No Products found!',
                                      style: context.appTextTheme.body1Medium,
                                    ),
                                  );
                                }

                                return SearchProductsList(
                                  products: state.products,
                                );
                              }

                              return SearchProductsList(products: []);
                            },
                          );
                        } else if (state is InternetConnectionDisconnected) {
                          return NoInternet();
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: context.appColors.cyan,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
