import 'package:ecommerce_app/core/common/widgets/product_item.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LatestProductsList extends StatelessWidget {
  const LatestProductsList({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 8.w,
        childAspectRatio: 160 / 198,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.take(6).length,
      itemBuilder: (context, index) {
        return ProductItem(product: products[index]);
      },
    );
  }
}
