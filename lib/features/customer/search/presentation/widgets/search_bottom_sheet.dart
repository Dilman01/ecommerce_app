import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/customer/search/presentation/bloc/search_products_bloc.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  double start = 0;
  double end = 100;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          height: 250.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: context.appColors.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24).r,
              topRight: Radius.circular(24).r,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price Range', style: context.appTextTheme.body1Medium),
              RangeSlider(
                values: RangeValues(start, end),
                min: 0,
                max: 100,
                activeColor: context.appColors.cyan,
                labels: RangeLabels('${start.round()}', '${end.round()}'),
                divisions: 100,
                onChanged: (value) {
                  setState(() {
                    start = value.start;
                    end = value.end;
                  });
                },
              ),
              CustomButton(
                onPressed: () {
                  context.read<SearchProductsBloc>().priceMin = start.toInt();
                  context.read<SearchProductsBloc>().priceMax = end.toInt();
                  final title = context.read<SearchProductsBloc>().searchTitle;
                  final priceMin = context.read<SearchProductsBloc>().priceMin;
                  final priceMax = context.read<SearchProductsBloc>().priceMax;

                  context.read<SearchProductsBloc>().add(
                    SearchProductByTitle(
                      title: title,
                      priceMin: priceMin,
                      priceMax: priceMax,
                    ),
                  );
                  context.pop();
                },
                title: 'Apply',
              ),
            ],
          ),
        );
      },
    );
  }
}
