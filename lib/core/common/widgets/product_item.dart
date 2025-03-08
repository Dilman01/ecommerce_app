import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.title, this.imageUrl, this.price});

  final String? title;
  final String? imageUrl;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteNames.productDetails);
      },
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              if (imageUrl != null)
                Container(
                  height: 138.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24).r,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(imageUrl!),

                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                Container(
                  height: 138.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24).r,
                    color: context.appColors.grey50,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 40.r,
                      color: context.appColors.grey100,
                    ),
                  ),
                ),
              Positioned(
                top: 6.h,
                right: 6.w,
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.appColors.favButtonBgColor,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      size: 18.r,
                      color: context.appColors.dynamicWhiteOrBlack,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            title ?? 'Unknown',
            overflow: TextOverflow.ellipsis,
            style: context.appTextTheme.body2Medium,
          ),
          Text('\$${price ?? 0}', style: context.appTextTheme.captionSemiBold),
        ],
      ),
    );
  }
}
