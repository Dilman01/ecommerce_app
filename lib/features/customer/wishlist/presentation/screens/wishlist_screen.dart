import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/customer/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce_app/features/customer/wishlist/presentation/widgets/empty_wishlist.dart';
import 'package:ecommerce_app/features/customer/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist', style: context.appTextTheme.body2Medium),
        centerTitle: true,
      ),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          final wishlistProducts =
              context.read<WishlistCubit>().wishlistProducts;

          if (wishlistProducts.isEmpty) {
            return const EmptyWishlist();
          }

          return ListView.separated(
            itemCount: wishlistProducts.length,
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 12.h),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final product = wishlistProducts[index];
              return WishlistItem(product: product);
            },
          );
        },
      ),
    );
  }
}
