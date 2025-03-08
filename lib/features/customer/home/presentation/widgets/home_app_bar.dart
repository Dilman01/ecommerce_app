import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
        SvgPicture.asset(context.assets.searchIcon, height: 32.h, width: 32.w),
        if (user == null || user.avatar == null)
          Icon(Icons.person, size: 32.r, color: context.appColors.white),

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
                  image: NetworkImage(
                    'https://fifpro.org/media/5chb3dva/lionel-messi_imago1019567000h.jpg?rxy=0.32986930611281567,0.18704579979466449&rnd=133378758718600000',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
