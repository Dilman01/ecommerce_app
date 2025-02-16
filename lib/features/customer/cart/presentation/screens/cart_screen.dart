import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/customer/cart/presentation/widgets/cart_item.dart';
import 'package:ecommerce_app/features/customer/cart/presentation/widgets/order_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: context.appTextTheme.body2Medium),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              heightFactor: 0.62,
              alignment: Alignment.topCenter,
              child: ListView.separated(
                itemCount: 2,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  return CartItem();
                },
              ),
            ),
            FractionallySizedBox(
              heightFactor: 0.38,
              alignment: Alignment.bottomCenter,
              child: OrderInfo(),
            ),
          ],
        ),
      ),
    );
  }
}
