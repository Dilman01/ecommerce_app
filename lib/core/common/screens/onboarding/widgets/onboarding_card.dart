import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';

class OnBoardingCard extends StatelessWidget {
  const OnBoardingCard({
    super.key,
    required this.pageController,
    required this.index,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isFirstPage,
    required this.isLastPage,
  });

  final PageController pageController;
  final int index;
  final String title;
  final String description;
  final String imagePath;

  final bool isFirstPage;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16).r,
      child: Column(
        spacing: 24.h,
        children: [
          Container(
            height: 408.h,
            width: 328.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32).r,
              color: context.appColors.cyan50,
            ),
            padding: EdgeInsets.only(
              left: 18.w,
              right: 18.w,
              top: 20.h,
              bottom: 70.h,
            ),
            child: Column(
              spacing: 20.h,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (isFirstPage)
                      SvgPicture.asset(
                        context.assets.appIcon,
                      ),
                    if (!isFirstPage)
                      GestureDetector(
                        onTap: () {
                          pageController.animateToPage(
                            index - 1,
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                            curve: Curves.linear,
                          );
                        },
                        child: SvgPicture.asset(
                          context.assets.arrowBack,
                        ),
                      ),
                    if (!isLastPage)
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Skip for now',
                          style: context.appTextTheme.body2Medium.copyWith(
                            color: context.appColors.cyan,
                          ),
                        ),
                      ),
                  ],
                ),
                Image.asset(
                  imagePath,
                  height: 240.h,
                  width: 240.w,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Text(
            title,
            style: context.appTextTheme.heading2Bold,
            textAlign: TextAlign.center,
          ),
          Text(
            description,
            style: context.appTextTheme.body2Regular,
            textAlign: TextAlign.center,
          ),
          if (!isLastPage)
            CustomButton(
              onPressed: () {
                pageController.animateToPage(
                  index + 1,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  curve: Curves.linear,
                );
              },
              title: 'Next',
            ),
          if (isLastPage)
            Row(
              spacing: 8.w,
              children: [
                CustomButton(
                  onPressed: () {},
                  title: 'Login',
                  backgroundColor: context.appColors.backgroundColor,
                  textButtonColor: context.appColors.buttonTextColor,
                  hasBorder: true,
                  size: Size(160.w, 60.h),
                ),
                CustomButton(
                  onPressed: () {},
                  title: 'Get Started',
                  size: Size(160.w, 60.h),
                  icon: SvgPicture.asset(
                    AppImages.arrowForward,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
