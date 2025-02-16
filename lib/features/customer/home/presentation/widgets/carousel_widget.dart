import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/customer/home/presentation/widgets/carousel_item.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  final List<Widget> items = [
    CarouselItem(),
    CarouselItem(),
    CarouselItem(),
    CarouselItem(),
    CarouselItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 148.h,
          width: double.infinity,
          margin: EdgeInsets.only(top: 24.h),
          child: CarouselSlider(
            items: items,
            carouselController: _controller,
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              viewportFraction: 1,
              autoPlay: false,
              padEnds: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          right: 32.w,
          bottom: 12.h,
          child: Container(
            height: 16.h,
            padding: EdgeInsets.all(5).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12).r,
              color: context.appColors.grey50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children:
                  items.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 6.w,
                        height: 6.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              _currentIndex == entry.key
                                  ? context.appColors.cyan
                                  : context.appColors.grey100,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
