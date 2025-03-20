import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ecommerce_app/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/di/init_dependencies.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/create_category/create_category_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_categories/presentation/widgets/create_category_bottom_sheet.dart';

class CreateCategoryWidget extends StatelessWidget {
  const CreateCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('All Categories', style: context.appTextTheme.heading3SemiBold),
        CustomButton(
          onPressed: () {
            CustomBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => sl<CreateCategoryBloc>()),
                  BlocProvider(create: (context) => sl<UploadImageCubit>()),
                ],
                child: const CreateCategoryBottomSheet(),
              ),
              whenComplete:
                  () => context.read<GetAllAdminCategoriesBloc>().add(
                    FetchAllCategories(isLoading: false),
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
