import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/widgets/product_item.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/customer/category/presentation/blocs/get_products_by_category_bloc/get_products_by_category_bloc.dart';

class CategoryProductsListScreen extends StatefulWidget {
  const CategoryProductsListScreen({
    super.key,
    required this.title,
    required this.id,
  });

  final String title;
  final int id;

  @override
  State<CategoryProductsListScreen> createState() =>
      _CategoryProductsListScreenState();
}

class _CategoryProductsListScreenState
    extends State<CategoryProductsListScreen> {
  @override
  void initState() {
    super.initState();

    context.read<GetProductsByCategoryBloc>().add(
      GetProductsByCategory(widget.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: context.appTextTheme.body2Medium),
      ),
      body: BlocBuilder<GetProductsByCategoryBloc, GetProductsByCategoryState>(
        builder: (context, state) {
          if (state is GetProductsByCategoryLoading) {
            return Center(
              child: CircularProgressIndicator(color: context.appColors.cyan),
            );
          }
          if (state is GetProductsByCategoryFailure) {
            return Center(child: Text(state.message));
          }

          if (state is ProductsByCategoryLoaded) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 8.w,
                childAspectRatio: 160 / 198,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductItem(
                  title: product.title,
                  imageUrl: product.images?.first,
                  price: product.price,
                );
              },
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
