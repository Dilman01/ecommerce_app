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
import 'package:ecommerce_app/features/admin/admin_products/data/models/update_product_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/blocs/update_product/update_product_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/widgets/categories_drop_down.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/widgets/update_product_images.dart';

class UpdateProductBottomSheet extends StatefulWidget {
  const UpdateProductBottomSheet({
    required this.imageList,
    required this.categoryName,
    required this.title,
    required this.price,
    required this.description,
    required this.productId,
    required this.categoryId,
    super.key,
  });

  final List<String> imageList;
  final String categoryName;
  final String title;
  final double price;
  final String description;
  final int productId;
  final int categoryId;

  @override
  State<UpdateProductBottomSheet> createState() =>
      _UpdateProductBottomSheetState();
}

class _UpdateProductBottomSheetState extends State<UpdateProductBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  String? categoryValueName;
  int? categoryValueId;

  @override
  void initState() {
    super.initState();

    categoryValueName = widget.categoryName;
    categoryValueId = widget.categoryId;
    _titleController.text = widget.title;
    _priceController.text = widget.price.toString();
    _descriptionController.text = widget.description;
  }

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
                  'Update Product',
                  style: context.appTextTheme.heading3SemiBold,
                ),
              ),
              SizedBox(height: 20.h),
              Text('Update Photos', style: context.appTextTheme.body2Medium),

              SizedBox(height: 15.h),
              UpdateProductImages(imageList: widget.imageList),
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
                      initialSelection: categoryValueName,
                      categories: state.categories,
                      onSelected: (value) {
                        categoryValueName = value;

                        categoryValueId =
                            state.categories
                                .firstWhere((element) => element.name == value)
                                .id!;
                      },
                    );
                  }
                  return CategoriesDropDown(
                    categories: [],
                    initialSelection: categoryValueName,
                    onSelected: (value) {},
                  );
                },
              ),
              SizedBox(height: 15.h),
              BlocConsumer<UpdateProductBloc, UpdateProductState>(
                listener: (context, state) {
                  if (state is UpdateProductSuccess) {
                    context.pop();
                    ShowToast.showToastSuccessTop(
                      message: '${_titleController.text} Updated Successfully!',
                      seconds: 2,
                    );
                  }
                  if (state is UpdateProductFailure) {
                    ShowToast.showToastErrorTop(
                      message: 'Error updating the product!',
                    );
                  }
                },
                builder: (context, state) {
                  if (state is UpdateProductLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: context.appColors.cyan,
                      ),
                    );
                  }

                  return CustomButton(
                    onPressed: () {
                      _validUpdateProduct(context);
                    },
                    title: 'Update',
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

  void _validUpdateProduct(BuildContext context) {
    if (fromKey.currentState!.validate()) {
      context.read<UpdateProductBloc>().add(
        UpdateProduct(
          UpdateProductReqBody(
            categoryId: categoryValueId!,
            title: _titleController.text.trim(),
            description: _descriptionController.text.trim(),
            price: double.parse(_priceController.text.trim()),
            imageList:
                context.read<UploadImageCubit>().imageUpdateList.isEmpty
                    ? widget.imageList
                    : context.read<UploadImageCubit>().imageUpdateList,
            productId: widget.productId,
          ),
        ),
      );
    }
  }
}
