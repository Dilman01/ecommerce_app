import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ecommerce_app/core/common/toast/show_toast.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        if (state is UploadImageSuccess) {
          ShowToast.showToastSuccessTop(
            message: 'Image Uploaded Successfully ✅',
          );
        }
        if (state is UploadImageError) {
          ShowToast.showToastErrorTop(message: 'Failed to upload image');
        }
        if (state is UploadImageRemove) {
          ShowToast.showToastSuccessTop(
            message: 'Image Removed Successfully ✅',
          );
        }
      },
      builder: (context, state) {
        final isImageUploaded =
            context.watch<UploadImageCubit>().getImageUrl.isNotEmpty;

        if (state is UploadImageLoading) {
          return Center(
            child: Container(
              height: 100.h,
              width: 100.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.appColors.grey100.withValues(alpha: 0.6),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  color: context.appColors.white,
                ),
              ),
            ),
          );
        }

        return Center(
          child: Stack(
            children: [
              if (isImageUploaded)
                GestureDetector(
                  onTap: () {
                    context.read<UploadImageCubit>().uploadImage(context);
                  },
                  child: Container(
                    height: 100.h,
                    width: 100.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          context.read<UploadImageCubit>().getImageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              else
                GestureDetector(
                  onTap: () {
                    context.read<UploadImageCubit>().uploadImage(context);
                  },
                  child: Container(
                    height: 100.h,
                    width: 100.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.appColors.grey100.withValues(alpha: 0.6),
                    ),
                    child: Icon(Icons.add_a_photo_outlined, size: 32.r),
                  ),
                ),
              if (isImageUploaded)
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      context.read<UploadImageCubit>().removeImage();
                    },
                    child: Icon(Icons.delete, color: context.appColors.red),
                  ),
                )
              else
                const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
