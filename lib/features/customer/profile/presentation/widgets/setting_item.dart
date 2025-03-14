import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_app/core/common/app/theme_cubit/theme_cubit.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.iconPath,
    this.isThemeToggle = false,
  });

  final VoidCallback onTap;
  final String title;
  final String iconPath;
  final bool isThemeToggle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        spacing: 14.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              spacing: 12.w,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(iconPath, height: 24.h, width: 24.w),
                Text(
                  title,
                  style: context.appTextTheme.body2Medium.copyWith(
                    color: context.appColors.grey150,
                  ),
                ),
                Spacer(),
                if (!isThemeToggle)
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.r,
                    color: context.appColors.grey150,
                  ),
                if (isThemeToggle)
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 17.h,
                        width: 29.w,
                        child: Switch(
                          value: state.themeMode == ThemeMode.dark,
                          activeColor: context.appColors.cyan,
                          inactiveThumbColor:
                              context.appColors.dynamicWhiteOrBlack,
                          inactiveTrackColor: context.appColors.grey150,
                          padding: EdgeInsets.zero,
                          onChanged: (value) {
                            context.read<ThemeCubit>().toggleTheme();
                          },
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
          Divider(color: context.appColors.grey50, height: 0, thickness: 1),
        ],
      ),
    );
  }
}
