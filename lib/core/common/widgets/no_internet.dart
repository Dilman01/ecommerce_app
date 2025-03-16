import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_app/core/common/app/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.h,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImages.noInternetImage),
        SizedBox(height: 4.h),
        Text(
          'No Internet Connection!',
          textAlign: TextAlign.center,
          style: context.appTextTheme.heading2Bold,
        ),
        Text(
          'Please check your internet connection then retry.',
          textAlign: TextAlign.center,
          style: context.appTextTheme.body1Medium.copyWith(
            color: context.appColors.grey150,
          ),
        ),
        SizedBox(height: 12.h),
        CustomButton(
          onPressed: () {
            context.read<InternetConnectionCubit>().retry();
          },
          title: 'Retry',
        ),
      ],
    );
  }
}
