import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ecommerce_app/core/common/toast/show_toast.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class CategoryUploadImage extends StatelessWidget {
  const CategoryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        if (state is UploadImageSuccess) {
          ShowToast.showToastSuccessTop(
            message: 'Image Uploaded Successfully!',
          );
        }
        if (state is UploadImageRemove) {
          ShowToast.showToastSuccessTop(message: 'Image Removed Successfully!');
        }
        if (state is UploadImageError) {
          ShowToast.showToastErrorTop(message: state.message);
        }
      },
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();

        if (state is UploadImageLoading) {
          return SizedBox(
            height: 120.h,
            child: Center(
              child: CircularProgressIndicator(color: context.appColors.cyan),
            ),
          );
        }

        if (cubit.getImageUrl.isNotEmpty) {
          return Container(
            height: 120.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(15).r,
              image: DecorationImage(image: NetworkImage(cubit.getImageUrl)),
            ),
          );
        } else {
          return InkWell(
            onTap: () {
              context.read<UploadImageCubit>().uploadImage(context);
            },
            child: Container(
              height: 120.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(15).r,
              ),
              child: Icon(
                Icons.add_a_photo_outlined,
                size: 50.r,
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }
}
