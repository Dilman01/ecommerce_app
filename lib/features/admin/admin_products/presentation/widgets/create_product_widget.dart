import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ecommerce_app/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/di/init_dependencies.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/blocs/create_product/create_product_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/blocs/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/widgets/create_product_bottom_sheet.dart';

class CreateProductWidget extends StatelessWidget {
  const CreateProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('All Products', style: context.appTextTheme.heading3SemiBold),
        CustomButton(
          onPressed: () {
            CustomBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => sl<CreateProductBloc>()),
                  BlocProvider(create: (context) => sl<UploadImageCubit>()),
                  BlocProvider(
                    create:
                        (context) =>
                            sl<GetAllAdminCategoriesBloc>()
                              ..add(const FetchAllCategories(isLoading: false)),
                  ),
                ],
                child: const CreateProductBottomSheet(),
              ),
              whenComplete:
                  () => context.read<GetAllAdminProductsBloc>().add(
                    const FetchAllAdminProducts(isLoading: false),
                  ),
            );
          },
          size: Size(120.w, 40.h),
          title: 'Add',
        ),
      ],
    );
  }
}
