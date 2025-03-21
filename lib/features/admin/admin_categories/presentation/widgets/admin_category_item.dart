import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ecommerce_app/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:ecommerce_app/core/di/init_dependencies.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/update_category/update_category_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/widgets/delete_category_widget.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/widgets/update_category_bottom_sheet.dart';

class AdminCategoryItem extends StatelessWidget {
  const AdminCategoryItem({
    super.key,
    required this.id,
    required this.title,
    required this.image,
  });
  final int id;
  final String? title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16).r,
        border: Border.all(color: context.appColors.grey50),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 55.h,
                width: 140.w,
                child: Text(
                  title ?? 'Unknown',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.appTextTheme.heading3SemiBold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 80.w,
                children: [
                  DeleteCategoryWidget(id: id),
                  IconButton(
                    onPressed: () {
                      CustomBottomSheet.showModalBottomSheetContainer(
                        context: context,
                        widget: MultiBlocProvider(
                          providers: [
                            BlocProvider(
                              create: (context) => sl<UpdateCategoryBloc>(),
                            ),
                            BlocProvider(
                              create: (context) => sl<UploadImageCubit>(),
                            ),
                          ],
                          child: UpdateCategoryBottomSheet(
                            imageUrl: image ?? '',
                            categoryId: id,
                            categoryName: title ?? 'Unknown',
                          ),
                        ),
                        whenComplete: () {
                          context.read<GetAllAdminCategoriesBloc>().add(
                            FetchAllCategories(isLoading: false),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 24.r,
                      color: context.appColors.arrowColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          CachedNetworkImage(
            imageUrl:
                image ??
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
            alignment: Alignment.center,
            width: 120.w,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
