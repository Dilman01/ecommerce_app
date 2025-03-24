import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_app/core/common/toast/show_toast.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/blocs/delete_product/delete_product_bloc.dart';
import 'package:ecommerce_app/features/admin/admin_products/presentation/blocs/get_all_admin_products/get_all_admin_products_bloc.dart';

class DeleteProductWidget extends StatelessWidget {
  const DeleteProductWidget({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteProductBloc, DeleteProductState>(
      listenWhen: (previous, current) {
        // Only trigger listener for states with matching ID
        if (current is DeleteProductSuccess) {
          return current.id == productId;
        }

        if (current is DeleteProductFailure) {
          return current.id == productId;
        }

        return false;
      },
      listener: (context, state) {
        if (!context.mounted) return;

        if (state is DeleteProductSuccess) {
          context.read<GetAllAdminProductsBloc>().add(
            const FetchAllAdminProducts(isLoading: false),
          );
          ShowToast.showToastSuccessTop(
            message: 'The Product was deleted successfully!',
          );
        }

        if (state is DeleteProductFailure) {
          ShowToast.showToastErrorTop(
            message: 'Error, the product was not deleted!',
          );
        }
      },
      builder: (context, state) {
        if (state is DeleteProductLoading) {
          if (state.id == productId) {
            return SizedBox(
              height: 24.h,
              width: 24.w,
              child: Center(
                child: CircularProgressIndicator(color: context.appColors.cyan),
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
            context.read<DeleteProductBloc>().add(DeleteProduct(productId));
          },
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(
            AppImages.deleteIcon,
            height: 24.h,
            width: 24.w,
          ),
        );
      },
    );
  }
}
