import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ecommerce_app/core/common/toast/show_toast.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class UpdateProductImages extends StatelessWidget {
  const UpdateProductImages({super.key, required this.imageList});

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return BlocConsumer<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            if (state is UploadImageSuccess) {
              ShowToast.showToastSuccessTop(
                message: 'Image Uploaded Successfully!',
              );
            }

            if (state is UploadImageError) {
              ShowToast.showToastErrorTop(message: state.message);
            }
          },
          builder: (context, state) {
            if (state is UploadImageLoadingList) {
              if (state.index == index) {
                return Container(
                  height: 120.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: context.appColors.cyan,
                    ),
                  ),
                );
              }

              return UpdateSelectedImageWidget(
                imageList: imageList,
                index: index,
                onTap: () {},
              );
            }
            return UpdateSelectedImageWidget(
              imageList: imageList,
              index: index,
              onTap: () {
                context.read<UploadImageCubit>().uploadUpdateImageList(
                  context,
                  indexId: index,
                  productImageList: imageList,
                );
              },
            );
          },
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 6.h),
    );
  }
}

class UpdateSelectedImageWidget extends StatelessWidget {
  const UpdateSelectedImageWidget({
    required this.imageList,
    required this.index,
    required this.onTap,
    super.key,
  });

  final List<String> imageList;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 120.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(15).r,
              image: DecorationImage(image: NetworkImage(imageList[index])),
            ),
          ),
          Container(
            height: 120.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(15).r,
            ),
            child: Center(
              child: Icon(
                Icons.add_a_photo_outlined,
                size: 50.r,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
