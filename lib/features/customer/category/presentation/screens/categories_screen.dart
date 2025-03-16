import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/app/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:ecommerce_app/core/common/widgets/no_internet.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/features/customer/category/presentation/blocs/categories_bloc/categories_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: context.appTextTheme.body2Medium),
        centerTitle: true,
      ),
      body: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
        builder: (context, state) {
          if (state is InternetConnectionConnected) {
            return BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: context.appColors.cyan,
                    ),
                  );
                }
                if (state is CategoriesFailure) {
                  return Center(child: Text(state.message));
                }
                if (state is AllCategoriesLoaded) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.w,
                      childAspectRatio: 160 / 100,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      final category = state.categories[index];
                      return InkWell(
                        onTap: () {
                          context.pushNamed(
                            RouteNames.categoryProductsList,
                            pathParameters: {
                              'id': category.id.toString(),
                              'title': category.name ?? 'Unknown',
                            },
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
                              CachedNetworkImage(
                                imageUrl:
                                    category.image ??
                                    'https://ozarkhighlandstrail.com/wp-content/themes/u-design/assets/images/placeholders/post-placeholder.jpg',
                                placeholder:
                                    (context, url) => Center(
                                      child: CircularProgressIndicator(
                                        color: context.appColors.cyan,
                                      ),
                                    ),
                                errorWidget:
                                    (context, url, error) => Center(
                                      child: Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 40.r,
                                        color: context.appColors.grey100,
                                      ),
                                    ),
                                height: 60.h,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                category.name ?? 'Unknown',
                                overflow: TextOverflow.ellipsis,
                                style: context.appTextTheme.captionSemiBold,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return SizedBox();
              },
            );
          } else if (state is InternetConnectionDisconnected) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: NoInternet(),
            );
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
