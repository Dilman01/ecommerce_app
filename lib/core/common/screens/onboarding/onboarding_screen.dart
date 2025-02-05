import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/screens/onboarding/widgets/onboarding_card.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      OnBoardingCard(
        pageController: _pageController,
        index: _currentPageIndex,
        title: 'Explore a wide range of products',
        description: 'Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.',
        imagePath: AppImages.onBoardingImage1,
        isFirstPage: true,
        isLastPage: false,
      ),
      OnBoardingCard(
        pageController: _pageController,
        index: _currentPageIndex,
        title: 'Unlock exclusive offers and discounts',
        description: 'Get access to limited-time deals and special promotions available only to our valued customers.',
        imagePath: AppImages.onBoardingImage2,
        isFirstPage: false,
        isLastPage: false,
      ),
      OnBoardingCard(
        pageController: _pageController,
        index: _currentPageIndex,
        title: 'Safe and secure payments',
        description: ' QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.',
        imagePath: AppImages.onBoardingImage3,
        isFirstPage: false,
        isLastPage: true,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: pages,
                onPageChanged: (value) {
                  setState(() {
                    _currentPageIndex = value;
                  });
                },
              ),
            ),
            Container(
              height: 16.h,
              width: 36.w,
              padding: EdgeInsets.all(5).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12).r,
                color: context.appColors.cyan50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: pages.asMap().entries.map(
                  (entry) {
                    return GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          entry.key,
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.linear,
                        );
                      },
                      child: Container(
                        width: 6.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPageIndex == entry.key ? context.appColors.cyan : context.appColors.grey100,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
