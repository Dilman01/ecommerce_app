import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/customer/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteNames.productDetails, extra: product);
      },
      child: SizedBox(
        height: 120.h,
        child: Row(
          spacing: 8.w,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (product.images?.first != null)
              Container(
                width: 120.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12).r,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12).r,
                  child: CachedNetworkImage(
                    imageUrl: product.images!.first,
                    placeholder:
                        (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: context.appColors.cyan,
                          ),
                        ),
                    errorWidget:
                        (context, url, error) => Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 40.r,
                            color: context.appColors.grey100,
                          ),
                        ),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  size: 40.r,
                  color: context.appColors.grey100,
                ),
              ),
            Column(
              spacing: 8.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 160.w,
                  child: Text(
                    product.title == null
                        ? 'Unknown'
                        : product.title!.isEmpty
                        ? 'Unknown'
                        : product.title ?? 'Unknown',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.appTextTheme.body2Medium,
                  ),
                ),
                Text(
                  '\$${product.price ?? 0}',
                  style: context.appTextTheme.captionSemiBold,
                ),
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
                      Text('1', style: context.appTextTheme.body1Medium),
                      InkWell(onTap: () {}, child: Icon(Icons.add, size: 24.r)),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  context.read<CartBloc>().add(RemoveFromCart(product.id!));
                },
                child: SvgPicture.asset(
                  AppImages.deleteIcon,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
