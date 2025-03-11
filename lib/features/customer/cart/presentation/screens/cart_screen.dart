import 'package:ecommerce_app/features/customer/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/customer/cart/presentation/widgets/cart_item.dart';
import 'package:ecommerce_app/features/customer/cart/presentation/widgets/empty_cart.dart';
import 'package:ecommerce_app/features/customer/cart/presentation/widgets/order_info.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: context.appTextTheme.body2Medium),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.products.isEmpty) {
            return EmptyCart();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Stack(
              fit: StackFit.expand,
              children: [
                FractionallySizedBox(
                  heightFactor: 0.62,
                  alignment: Alignment.topCenter,
                  child: ListView.separated(
                    itemCount: state.products.length,
                    separatorBuilder:
                        (context, index) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return CartItem(product: product);
                    },
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: 0.38,
                  alignment: Alignment.bottomCenter,
                  child: OrderInfo(products: state.products),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
