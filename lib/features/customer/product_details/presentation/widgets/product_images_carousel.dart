import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class ProductImagesCarousel extends StatefulWidget {
  const ProductImagesCarousel({super.key, required this.images});

  final List<String> images;

  @override
  State<ProductImagesCarousel> createState() => _ProductImagesCarouselState();
}

class _ProductImagesCarouselState extends State<ProductImagesCarousel> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> items =
        widget.images.map((image) {
          return SizedBox(
            height: 290.h,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: image,
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
          );
        }).toList();
    return Stack(
      children: [
        CarouselSlider(
          items: items,
          carouselController: _controller,
          options: CarouselOptions(
            enableInfiniteScroll: true,
            height: 290.h,
            viewportFraction: 1,
            autoPlay: false,
            padEnds: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          top: 240.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12).r,
                  color: context.appColors.grey50,
                ),
                child: Wrap(
                  spacing: 4.w,
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
            ],
          ),
        ),
      ],
    );
  }
}
