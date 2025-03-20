import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_app/core/common/toast/show_toast.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/delete_category/delete_category_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';

class DeleteCategoryWidget extends StatelessWidget {
  const DeleteCategoryWidget({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      width: 24.w,
      child: BlocConsumer<DeleteCategoryBloc, DeleteCategoryState>(
        listenWhen: (previous, current) {
          // Only trigger listener for states with matching ID
          if (current is DeleteCategorySuccess) {
            return current.id == id;
          }
          if (current is DeleteCategoryFailure) {
            return current.id == id;
          }
          return false;
        },
        listener: (context, state) {
          if (!context.mounted) return;

          if (state is DeleteCategorySuccess) {
            context.read<GetAllAdminCategoriesBloc>().add(
              FetchAllCategories(isLoading: false),
            );
            ShowToast.showToastSuccessTop(
              message: 'The Category was deleted successfully!',
            );
          }
          if (state is DeleteCategoryFailure) {
            ShowToast.showToastErrorTop(
              message: 'Error, the category was not deleted!',
            );
          }
        },
        builder: (context, state) {
          if (state is DeleteCategoryLoading) {
            if (state.id == id) {
              return SizedBox(
                height: 24.h,
                width: 24.w,
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.appColors.cyan,
                  ),
                ),
              );
            } else {
              return SvgPicture.asset(
                AppImages.deleteIcon,
                height: 24.h,
                width: 24.w,
              );
            }
          }
          return IconButton(
            onPressed: () {
              context.read<DeleteCategoryBloc>().add(DeleteCategory(id));
            },
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              AppImages.deleteIcon,
              height: 24.h,
              width: 24.w,
            ),
          );
        },
      ),
    );
  }
}
