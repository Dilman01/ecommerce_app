import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthBloc>().user;

    return Row(
      spacing: 12.w,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(context.assets.appIcon, height: 32.h),
        Spacer(),
        GestureDetector(
          onTap: () {
            context.pushNamed(RouteNames.search);
          },
          child: SvgPicture.asset(
            context.assets.searchIcon,
            height: 32.h,
            width: 32.w,
          ),
        ),

        if (user != null && user.avatar != null)
          GestureDetector(
            onTap: () {
              context.goNamed(RouteNames.profile);
            },
            child: Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(user.avatar!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        if (user == null || user.avatar == null)
          GestureDetector(
            onTap: () {
              context.goNamed(RouteNames.profile);
            },
            child: Icon(Icons.person, size: 32.r),
          ),
      ],
    );
  }
}
