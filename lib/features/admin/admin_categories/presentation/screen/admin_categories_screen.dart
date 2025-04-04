import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:ecommerce_app/core/common/widgets/no_internet.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/widgets/admin_category_item.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/widgets/create_category_widget.dart';

class AdminCategoriesScreen extends StatelessWidget {
  const AdminCategoriesScreen({super.key});

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
                const CreateCategoryWidget(),
                Expanded(
                  child: RefreshIndicator(
                    color: context.appColors.cyan,
                    backgroundColor: context.appColors.backgroundColor,
                    onRefresh: () async {
                      context.read<GetAllAdminCategoriesBloc>().add(
                        const FetchAllCategories(isLoading: true),
                      );
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: BlocBuilder<
                            GetAllAdminCategoriesBloc,
                            GetAllAdminCategoriesState
                          >(
                            builder: (context, state) {
                              if (state is GetAllAdminCategoriesLoading) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: context.appColors.cyan,
                                  ),
                                );
                              }
                              if (state is GetAllAdminCategoriesFailure) {
                                return Center(
                                  child: Text(
                                    state.message,
                                    style: context.appTextTheme.body2Medium,
                                  ),
                                );
                              }
                              if (state is GetAllAdminCategoriesSuccess) {
                                final categories = state.categories;
                                return ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final category = categories[index];
                                    return AdminCategoryItem(
                                      id: category.id ?? 0,
                                      title: category.name,
                                      image: category.image,
                                    );
                                  },
                                  separatorBuilder:
                                      (context, index) =>
                                          SizedBox(height: 15.h),
                                  itemCount: categories.length,
                                );
                              }

                              return const SizedBox();
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
