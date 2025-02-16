import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: Row(
        spacing: 8.w,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12).r,
              image: DecorationImage(
                image: NetworkImage(
                  'https://media.wired.com/photos/61bd571ff6b645152a4dc4ad/master/pass/Evolution-Luxury-Watches-Oris.jpg',
                ),
                fit: BoxFit.cover,
              ),
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
                  'Loop Silicone Strong Magnetic Watch',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.appTextTheme.body2Medium,
                ),
              ),
              Text('\$15.25', style: context.appTextTheme.captionSemiBold),
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
              onTap: () {},
              child: SvgPicture.asset(
                AppImages.deleteIcon,
                height: 24.h,
                width: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
