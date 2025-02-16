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
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FractionallySizedBox(
              heightFactor: 0.6,
              alignment: Alignment.topCenter,
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  return CartItem();
                },
              ),
            ),
            FractionallySizedBox(
              heightFactor: 0.4,
              alignment: Alignment.bottomCenter,
              child: OrderInfo(),
            ),
          ],
        ),
      ),
    );
  }
}
