import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

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
              Container(
                height: 138.h,
                width: 160.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24).r,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://i.ebayimg.com/images/g/iLgAAOSwLHBjiGcG/s-l1200.webp',
                    ),
                    fit: BoxFit.cover,
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
            'Nike air jorda retro',
            overflow: TextOverflow.ellipsis,
            style: context.appTextTheme.body2Medium,
          ),
          Text('\$126.00', style: context.appTextTheme.captionSemiBold),
        ],
      ),
    );
  }
}
