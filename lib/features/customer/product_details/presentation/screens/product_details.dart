import 'package:ecommerce_app/core/common/toast/show_toast.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/features/customer/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/customer/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/colors/app_colors.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
// import 'package:ecommerce_app/features/customer/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/customer/product_details/presentation/widgets/product_chip.dart';
import 'package:ecommerce_app/features/customer/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/customer/product_details/presentation/widgets/product_images_carousel.dart';
import 'package:ecommerce_app/features/customer/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/customer/product_details/presentation/widgets/product_title.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      AppColors.brown,
      AppColors.grey150Light,
      AppColors.purple,
      AppColors.blue,
      AppColors.grey150Dark,
    ];

    bool isLoading = false;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ProductImagesCarousel(images: product.images ?? []),
            BlocBuilder<WishlistCubit, WishlistState>(
              builder: (context, state) {
                return Positioned(
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
                      onPressed: () async {
                        await context.read<WishlistCubit>().manageWishlist(
                          product: product,
                        );
                      },
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        context.read<WishlistCubit>().isFavorite(product.id!)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 20.r,
                        color:
                            context.read<WishlistCubit>().isFavorite(
                                  product.id!,
                                )
                                ? context.appColors.red
                                : context.appColors.dynamicWhiteOrBlack,
                      ),
                    ),
                  ),
                );
              },
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
                  topLeft: const Radius.circular(24).r,
                  topRight: const Radius.circular(24).r,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductChip(),
                  SizedBox(height: 6.h),
                  ProductTitle(
                    title: product.title ?? 'Unknown',
                    price: product.price ?? 0.0,
                  ),
                  SizedBox(height: 12.h),
                  const ProductRating(),
                  SizedBox(height: 12.h),
                  ProductDescription(
                    description: product.description ?? 'Unknown',
                  ),
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
                        onPressed: () {
                          context.pushNamed(RouteNames.checkout);
                        },
                        title: 'Buy Now',
                        backgroundColor: context.appColors.backgroundColor,
                        textButtonColor: context.appColors.buttonTextColor,
                        hasBorder: true,
                        size: Size(160.w, 60.h),
                      ),
                      BlocConsumer<CartBloc, CartState>(
                        listener: (context, state) {
                          if (state is CartSuccess) {
                            isLoading = false;
                            ShowToast.showToastSuccessTop(
                              message: 'Product Added To Cart ✅',
                            );
                          }
                          if (state is CartError) {
                            isLoading = false;
                            ShowToast.showToastErrorTop(message: state.message);
                          }
                          if (state is CartLoading) {
                            isLoading = true;
                          }
                        },
                        builder: (context, state) {
                          return CustomButton(
                            onPressed: () {
                              context.read<CartBloc>().add(AddToCart(product));
                            },
                            isLoading: isLoading,
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
                          );
                        },
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
