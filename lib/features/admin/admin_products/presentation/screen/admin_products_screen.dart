import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:ecommerce_app/core/common/widgets/no_internet.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/blocs/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/widgets/admin_product_item.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/widgets/create_product_widget.dart';

class AdminProductsScreen extends StatelessWidget {
  const AdminProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
        builder: (context, state) {
          if (state is InternetConnectionConnected) {
            return Column(
              spacing: 20.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CreateProductWidget(),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<GetAllAdminProductsBloc>().add(
                        FetchAllAdminProducts(isLoading: true),
                      );
                    },
                    color: context.appColors.cyan,
                    backgroundColor: context.appColors.backgroundColor,
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: BlocBuilder<
                            GetAllAdminProductsBloc,
                            GetAllAdminProductsState
                          >(
                            builder: (context, state) {
                              if (state is GetAllAdminProductsLoading) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: context.appColors.cyan,
                                  ),
                                );
                              }

                              if (state is GetAllAdminProductsFailure) {
                                return Center(
                                  child: Text(
                                    state.message,
                                    style: context.appTextTheme.body2Medium,
                                  ),
                                );
                              }

                              if (state is GetAllAdminProductsSuccess) {
                                final products = state.products;

                                return GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 4.w,
                                        mainAxisSpacing: 16.h,
                                        childAspectRatio: 165.w / 260.h,
                                      ),
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: products.length,
                                  itemBuilder: (context, index) {
                                    final product = products[index];
                                    return AdminProductItem(
                                      imageUrl: product.images?.first ?? '',
                                      title: product.title ?? 'Unknown',
                                      categoryName:
                                          product.category?.name ?? 'Unknown',
                                      price: product.price ?? 0,
                                      productId: product.id ?? 0,
                                      imageList: product.images ?? [],
                                      description:
                                          product.description ?? 'Unknown',
                                      categoryId: product.category?.id ?? 0,
                                    );
                                  },
                                );
                              }

                              return SizedBox();
                            },
                          ),
                        ),
                      ],
                    ),
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
    );
  }
}
