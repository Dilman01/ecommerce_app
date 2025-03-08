import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/features/customer/category/presentation/bloc/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return Center(
            child: CircularProgressIndicator(color: context.appColors.grey100),
          );
        }
        if (state is CategoriesFailure) {
          return Center(child: Text(state.message));
        }

        if (state is AllCategoriesLoaded) {
          return SizedBox(
            height: 70.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (context, index) => SizedBox(width: 8.w),
              itemBuilder: (context, index) {
                final category = state.categories[index];
                return InkWell(
                  onTap: () {
                    context.pushNamed(
                      RouteNames.productsList,
                      pathParameters: {'title': category.name ?? 'Unknown'},
                    );
                  },
                  borderRadius: BorderRadius.circular(12).r,
                  child: Container(
                    width: 94.w,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12).r,
                      border: Border.all(color: context.appColors.grey50),
                    ),
                    child: Column(
                      spacing: 4.h,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              category.image ??
                              'https://ozarkhighlandstrail.com/wp-content/themes/u-design/assets/images/placeholders/post-placeholder.jpg',
                          placeholder:
                              (context, url) => CircularProgressIndicator(),
                          errorWidget:
                              (context, url, error) =>
                                  SvgPicture.asset(context.assets.appIcon),
                          height: 30.h,
                          width: 60.w,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          category.name ?? 'Unknown',
                          overflow: TextOverflow.ellipsis,
                          style: context.appTextTheme.overlineSemiBold,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
