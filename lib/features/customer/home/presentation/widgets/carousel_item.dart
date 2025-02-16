import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 148.h,
      width: double.infinity,
      padding: EdgeInsets.only(left: 12.w, bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24).r,
        image: DecorationImage(
          image: NetworkImage(
            'https://img.freepik.com/premium-photo/black-headphones-blue-background-headphones-are-overear-have-modern-design_14117-205216.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6.h,
        children: [
          Container(
            padding: EdgeInsets.all(5).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8).r,
              color: context.appColors.black,
            ),
            child: Text(
              '30% OFF',
              style: context.appTextTheme.overlineSemiBold.copyWith(
                color: context.appColors.white,
              ),
            ),
          ),
          Text(
            'On Headphones',
            style: context.appTextTheme.captionRegular.copyWith(
              color: context.appColors.white,
            ),
          ),
          Text(
            'Exclusive Sales',
            style: context.appTextTheme.heading2Bold.copyWith(
              color: context.appColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
