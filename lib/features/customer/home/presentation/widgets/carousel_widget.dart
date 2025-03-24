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
    const CarouselItem(
      imageUrl:
          'https://img.freepik.com/premium-photo/black-headphones-blue-background-headphones-are-overear-have-modern-design_14117-205216.jpg',
      discount: '30',
      productTitle: 'On Headphones',
    ),
    const CarouselItem(
      imageUrl:
          'https://static.vecteezy.com/system/resources/previews/027/807/254/non_2x/t-shirts-mockup-with-text-space-on-colrful-background-hd-ai-free-photo.jpg',
      discount: '20',
      productTitle: 'On T-Shirts',
    ),
    const CarouselItem(
      imageUrl:
          'https://t3.ftcdn.net/jpg/06/28/06/20/360_F_628062031_JfPJNvjOASTUBiXdOVekeQB53YIe3KHu.jpg',
      discount: '15',
      productTitle: 'On Laptops',
    ),
    const CarouselItem(
      imageUrl:
          'https://img.freepik.com/premium-photo/dark-living-room-interior-design-with-sofa-plant-3d-rendering-background_517102-221.jpg',
      discount: '40',
      productTitle: 'On Furniture',
    ),
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
            padding: const EdgeInsets.all(5).r,
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
