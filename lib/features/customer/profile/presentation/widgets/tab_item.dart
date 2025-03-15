import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app/theme_cubit/theme_cubit.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.title, required this.isSelected});
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 158.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12).r,
        color: isSelected ? context.appColors.black : context.appColors.grey50,
      ),
      child: Center(
        child: Text(
          title,
          style: context.appTextTheme.button2SemiBold.copyWith(
            color:
                context.read<ThemeCubit>().state.themeMode == ThemeMode.light &&
                        isSelected
                    ? context.appColors.white
                    : context.read<ThemeCubit>().state.themeMode ==
                            ThemeMode.light &&
                        !isSelected
                    ? context.appColors.black
                    : context.appColors.white,
          ),
        ),
      ),
    );
  }
}
