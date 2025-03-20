import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ecommerce_app/core/common/toast/show_toast.dart';
import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/admin/admin_categories/data/model/create_category_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/create_category/create_category_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/widgets/category_upload_image.dart';

class CreateCategoryBottomSheet extends StatefulWidget {
  const CreateCategoryBottomSheet({super.key});

  @override
  State<CreateCategoryBottomSheet> createState() =>
      _CreateCategoryBottomSheetState();
}

class _CreateCategoryBottomSheetState extends State<CreateCategoryBottomSheet> {
  TextEditingController nameCategoryController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Create Category',
                style: context.appTextTheme.heading3SemiBold,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Add a photo', style: context.appTextTheme.body2Medium),
                BlocBuilder<UploadImageCubit, UploadImageState>(
                  builder: (context, state) {
                    if (context.read<UploadImageCubit>().getImageUrl.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return CustomButton(
                      onPressed: () {
                        context.read<UploadImageCubit>().removeImage();
                      },
                      size: Size(120.w, 20.h),
                      backgroundColor: context.appColors.red,
                      title: 'Remove',
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h),
            const CategoryUploadImage(),
            SizedBox(height: 20.h),
            CustomTextFormField(
              controller: nameCategoryController,
              title: 'Category Name',
              textCapitalization: TextCapitalization.words,
              hintText: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please Selected Your Category Name';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            BlocConsumer<CreateCategoryBloc, CreateCategoryState>(
              listener: (context, state) {
                if (state is CreateCategorySuccess) {
                  context.pop();
                  ShowToast.showToastSuccessTop(
                    message:
                        '${nameCategoryController.text} Created Successfully!',
                    seconds: 2,
                  );
                }
                if (state is CreateCategoryFailure) {
                  ShowToast.showToastErrorTop(message: state.message);
                }
              },
              builder: (context, state) {
                if (state is CreateCategoryLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: context.appColors.cyan,
                    ),
                  );
                }

                return CustomButton(
                  onPressed: () {
                    _validCreateCategory(context);
                  },
                  title: 'Create',
                );
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  void _validCreateCategory(BuildContext context) {
    if (formKey.currentState!.validate() ||
        context.read<UploadImageCubit>().getImageUrl.isEmpty) {
      if (context.read<UploadImageCubit>().getImageUrl.isEmpty) {
        ShowToast.showToastErrorTop(message: 'Please upload category image.');
      } else {
        // create category
        context.read<CreateCategoryBloc>().add(
          CreateCategory(
            CreateCategoryReqBody(
              image: context.read<UploadImageCubit>().getImageUrl,
              name: nameCategoryController.text.trim(),
            ),
          ),
        );
      }
    }
  }
}
