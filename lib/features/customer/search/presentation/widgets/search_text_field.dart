import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/customer/search/presentation/bloc/search_products_bloc.dart';
import 'package:ecommerce_app/features/customer/search/presentation/widgets/search_bottom_sheet.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        context.read<SearchProductsBloc>().searchTitle = value;
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
      },
      controller: controller,
      cursorColor: context.appColors.arrowColor,
      autofocus: true,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 12.w),
          child: SvgPicture.asset(
            context.assets.searchIcon,
            height: 24.h,
            width: 24.w,
            colorFilter: ColorFilter.mode(
              context.appColors.grey150,
              BlendMode.srcIn,
            ),
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();

            showModalBottomSheet(
              context: context,
              builder: (_) {
                return BlocProvider.value(
                  value: BlocProvider.of<SearchProductsBloc>(
                    context,
                    listen: false,
                  ),
                  child: const SearchBottomSheet(),
                );
              },
            );
          },
          icon: SvgPicture.asset(
            AppImages.filterIcon,
            height: 24.h,
            width: 24.w,
          ),
        ),
        hintText: 'Search',
        hintStyle: context.appTextTheme.captionRegular.copyWith(
          color: context.appColors.grey150,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: context.appColors.grey50),
          borderRadius: BorderRadius.circular(12).r,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.appColors.grey50),
          borderRadius: BorderRadius.circular(12).r,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.appColors.grey50),
          borderRadius: BorderRadius.circular(12).r,
        ),
      ),
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      style: context.appTextTheme.captionRegular,
    );
  }
}
