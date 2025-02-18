import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/colors/app_colors.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/customer/product_details/presentation/widgets/produc_chip.dart';
import 'package:ecommerce_app/features/customer/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/customer/product_details/presentation/widgets/product_images_carousel.dart';
import 'package:ecommerce_app/features/customer/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/customer/product_details/presentation/widgets/product_title.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      AppColors.brown,
      AppColors.grey150Light,
      AppColors.purple,
      AppColors.blue,
      AppColors.grey150Dark,
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ProductImagesCarousel(),
            Positioned(
              top: 44.h,
              right: 16.w,
              child: Container(
                height: 32.h,
                width: 32.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.appColors.favButtonBgColor,
                ),
                child: IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 20.r,
                    color: context.appColors.dynamicWhiteOrBlack,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 44.h,
              left: 16.w,
              child: SizedBox(
                height: 32.h,
                width: 32.w,
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.keyboard_backspace_outlined,
                    size: 32.r,
                    color: context.appColors.favButtonBgColor,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 270.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: context.appColors.backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24).r,
                  topRight: Radius.circular(24).r,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductChip(),
                  SizedBox(height: 6.h),
                  ProductTitle(),
                  SizedBox(height: 12.h),
                  ProductRating(),
                  SizedBox(height: 12.h),
                  ProductDescription(),
                  SizedBox(height: 12.h),
                  Text('Colors', style: context.appTextTheme.captionSemiBold),
                  SizedBox(height: 8.h),
                  Row(
                    spacing: 4.w,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                        colors.map((color) {
                          return Container(
                            height: 32.h,
                            width: 32.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: color,
                            ),
                          );
                        }).toList(),
                  ),
                  SizedBox(height: 12.h),
                  Text('Quantity', style: context.appTextTheme.captionSemiBold),
                  SizedBox(height: 8.h),
                  Container(
                    width: 96.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8).r,
                      border: Border.all(color: context.appColors.grey50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(Icons.remove, size: 24.r),
                        ),
                        Text('0', style: context.appTextTheme.body1Medium),
                        InkWell(
                          onTap: () {},
                          child: Icon(Icons.add, size: 24.r),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 48.h),
                  Row(
                    spacing: 8.w,
                    children: [
                      CustomButton(
                        onPressed: () {},
                        title: 'Buy Now',
                        backgroundColor: context.appColors.backgroundColor,
                        textButtonColor: context.appColors.buttonTextColor,
                        hasBorder: true,
                        size: Size(160.w, 60.h),
                      ),
                      CustomButton(
                        onPressed: () {},
                        title: 'Add To Cart',
                        size: Size(160.w, 60.h),
                        icon: SvgPicture.asset(
                          AppImages.cartIconUnselected,
                          colorFilter: ColorFilter.mode(
                            context.appColors.white,
                            BlendMode.srcIn,
                          ),
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
