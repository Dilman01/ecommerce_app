import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ecommerce_app/core/common/toast/show_toast.dart';
import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/admin/admin_categories/data/model/update_category_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/update_category/update_category_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/widgets/update_upload_image.dart';

class UpdateCategoryBottomSheet extends StatefulWidget {
  const UpdateCategoryBottomSheet({
    super.key,
    required this.imageUrl,
    required this.categoryId,
    required this.categoryName,
  });

  final int categoryId;
  final String imageUrl;
  final String categoryName;
  @override
  State<UpdateCategoryBottomSheet> createState() =>
      _UpdateCategoryBottomSheetState();
}

class _UpdateCategoryBottomSheetState extends State<UpdateCategoryBottomSheet> {
  TextEditingController nameCategoryController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    nameCategoryController.text = widget.categoryName;
  }

  @override
  void dispose() {
    nameCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Update Category',
              style: context.appTextTheme.heading3SemiBold,
            ),
          ),
          SizedBox(height: 20.h),
          Text('Update a photo', style: context.appTextTheme.body2Medium),
          SizedBox(height: 10.h),
          UpdateUploadImage(imageUrl: widget.imageUrl),
          SizedBox(height: 20.h),
          CustomTextFormField(
            controller: nameCategoryController,
            title: 'Update The Category Name',
            hintText: 'Category Name',
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 2) {
                return 'Please Selected Your Category Name';
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          BlocConsumer<UpdateCategoryBloc, UpdateCategoryState>(
            listener: (context, state) {
              if (state is UpdateCategorySuccess) {
                context.pop();
                ShowToast.showToastSuccessTop(
                  message:
                      '${nameCategoryController.text} Updated Successfully!',
                  seconds: 2,
                );
              }
              if (state is UpdateCategoryFailure) {
                ShowToast.showToastErrorTop(message: state.message);
              }
            },
            builder: (context, state) {
              if (state is UpdateCategoryLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: context.appColors.cyan,
                  ),
                );
              }

              return CustomButton(
                onPressed: () {
                  _validUpdateCategory(context);
                },
                title: 'Update',
              );
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  void _validUpdateCategory(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<UpdateCategoryBloc>().add(
        UpdateCategory(
          UpdateCategoryReqBody(
            id: widget.categoryId,
            image:
                context.read<UploadImageCubit>().getImageUrl.isEmpty
                    ? widget.imageUrl
                    : context.read<UploadImageCubit>().getImageUrl,
            name: nameCategoryController.text.trim(),
          ),
        ),
      );
    }
  }
}
