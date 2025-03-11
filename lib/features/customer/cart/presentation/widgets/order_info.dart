import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    final allPrices = products.map((e) => e.price).toList();
    double total = 0;

    for (double? price in allPrices) {
      total += price!;
    }

    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4.h),
        Text('Order Info', style: context.appTextTheme.body1Medium),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
            Text(
              '\$$total',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Cost',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
            Text(
              '\$0.00',
              style: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: context.appTextTheme.body1Medium),
            Text('\$$total', style: context.appTextTheme.body1Medium),
          ],
        ),
        SizedBox(height: 8.h),
        CustomButton(onPressed: () {}, title: 'Checkout'),
      ],
    );
  }
}
