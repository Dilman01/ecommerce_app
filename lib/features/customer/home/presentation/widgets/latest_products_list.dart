import 'package:ecommerce_app/core/common/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LatestProductsList extends StatelessWidget {
  const LatestProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 8.w,
        // childAspectRatio: 2 / 3,
        childAspectRatio: 160 / 198,
      ),
      shrinkWrap: true,

      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ProductItem();
      },
    );
  }
}
