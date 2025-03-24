import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ecommerce_app/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:ecommerce_app/core/di/init_dependencies.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/blocs/delete_product/delete_product_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/blocs/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/blocs/update_product/update_product_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/widgets/delete_product_widget.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/widgets/update_product_bottom_sheet.dart';

class AdminProductItem extends StatelessWidget {
  const AdminProductItem({
    required this.imageUrl,
    required this.title,
    required this.categoryName,
    required this.price,
    required this.productId,
    required this.imageList,
    required this.description,
    required this.categoryId,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String categoryName;
  final String description;
  final double price;
  final int productId;
  final int categoryId;
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.h,
      width: 165.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16).r,
        border: Border.all(color: context.appColors.grey50),
      ),
      padding: const EdgeInsets.all(8).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocProvider(
                create: (context) => sl<DeleteProductBloc>(),
                child: DeleteProductWidget(productId: productId),
              ),
              IconButton(
                onPressed: () {
                  CustomBottomSheet.showModalBottomSheetContainer(
                    context: context,
                    widget: MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => sl<UpdateProductBloc>(),
                        ),
                        BlocProvider(
                          create: (context) => sl<UploadImageCubit>(),
                        ),
                        BlocProvider(
                          create:
                              (context) =>
                                  sl<GetAllAdminCategoriesBloc>()
                                    ..add(const FetchAllCategories(isLoading: false)),
                        ),
                      ],
                      child: UpdateProductBottomSheet(
                        imageList: imageList,
                        categoryName: categoryName,
                        description: description,
                        price: price,
                        productId: productId,
                        title: title,
                        categoryId: categoryId,
                      ),
                    ),
                    whenComplete: () {
                      context.read<GetAllAdminProductsBloc>().add(
                        const FetchAllAdminProducts(isLoading: false),
                      );
                    },
                  );
                },
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.edit,
                  size: 24.r,
                  color: context.appColors.arrowColor,
                ),
              ),
            ],
          ),
          Flexible(
            child: Center(
              child: CachedNetworkImage(
                height: 200.h,
                width: 120.w,
                imageUrl: imageUrl,
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
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: context.appTextTheme.body2Medium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            categoryName,
            style: context.appTextTheme.body2Regular,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            '\$$price',
            style: context.appTextTheme.body2Regular,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
