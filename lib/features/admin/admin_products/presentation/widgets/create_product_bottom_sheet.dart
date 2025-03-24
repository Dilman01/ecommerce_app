import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ecommerce_app/core/common/toast/show_toast.dart';
import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/data/models/create_product_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/blocs/create_product/create_product_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/widgets/categories_drop_down.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/widgets/create_product_images.dart';

class CreateProductBottomSheet extends StatefulWidget {
  const CreateProductBottomSheet({super.key});

  @override
  State<CreateProductBottomSheet> createState() =>
      _CreateProductBottomSheetState();
}

class _CreateProductBottomSheetState extends State<CreateProductBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  String? categoryName;
  int? categoryId;

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Form(
        key: fromKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Create Product',
                  style: context.appTextTheme.heading3SemiBold,
                ),
              ),
              SizedBox(height: 20.h),
              Text('Add Photos', style: context.appTextTheme.body2Medium),
              SizedBox(height: 15.h),
              const CreateProductImages(),
              SizedBox(height: 15.h),
              CustomTextFormField(
                controller: _titleController,
                title: 'Title',
                textCapitalization: TextCapitalization.words,
                hintText: 'Write the title',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'Invalid Title.';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15.h),
              CustomTextFormField(
                controller: _priceController,
                title: 'Price',
                hintText: 'Write the price',

                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Invalid Price.';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15.h),
              CustomTextFormField(
                controller: _descriptionController,
                title: 'Description',
                hintText: 'Write the description',
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'Invalid Description.';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15.h),

              BlocBuilder<
                GetAllAdminCategoriesBloc,
                GetAllAdminCategoriesState
              >(
                builder: (context, state) {
                  if (state is GetAllAdminCategoriesSuccess) {
                    return CategoriesDropDown(
                      categories: state.categories,
                      onSelected: (value) {
                        categoryName = value;

                        categoryId =
                            state.categories
                                .firstWhere((element) => element.name == value)
                                .id!;
                      },
                    );
                  }
                  return CategoriesDropDown(
                    categories: const [],
                    onSelected: (value) {},
                  );
                },
              ),
              SizedBox(height: 15.h),
              BlocConsumer<CreateProductBloc, CreateProductState>(
                listener: (context, state) {
                  if (state is CreateProductSuccess) {
                    context.pop();
                    ShowToast.showToastSuccessTop(
                      message: '${_titleController.text} Created Successfully!',
                      seconds: 2,
                    );
                  }
                  if (state is CreateProductFailure) {
                    ShowToast.showToastErrorTop(
                      message: 'Error creating the product!',
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CreateProductLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: context.appColors.cyan,
                      ),
                    );
                  }

                  return CustomButton(
                    onPressed: () {
                      _validCreateProductButton(context);
                    },
                    title: 'Create',
                  );
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  void _validCreateProductButton(BuildContext context) {
    final indexEmptyImage = context
        .read<UploadImageCubit>()
        .imageList
        .indexWhere((e) => e.isNotEmpty);

    if (fromKey.currentState!.validate() ||
        indexEmptyImage == -1 ||
        categoryName == null) {
      if (indexEmptyImage == -1) {
        ShowToast.showToastErrorTop(
          message: 'Please Upload the product image.',
        );
      } else if (categoryName == null) {
        ShowToast.showToastErrorTop(message: 'Please select your category.s');
      } else {
        context.read<CreateProductBloc>().add(
          CreateProduct(
            CreateProductReqBody(
              title: _titleController.text.trim(),
              description: _descriptionController.text.trim(),
              price: double.parse(_priceController.text.trim()),
              imageList:
                  context
                      .read<UploadImageCubit>()
                      .imageList
                      .where((element) => element.isNotEmpty)
                      .toList(),
              categoryId: categoryId ?? 0,
            ),
          ),
        );
      }
    }
  }
}
