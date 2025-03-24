import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthBloc>().user;
    return AppBar(
      backgroundColor: context.appColors.cyan,
      toolbarHeight: kToolbarHeight + 20,
      centerTitle: false,
      titleSpacing: 16.w,
      title: Row(
        spacing: 8.w,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (user != null && user.avatar != null)
            Container(
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8).r,
                image: DecorationImage(
                  image: NetworkImage(user.avatar!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (user == null || user.avatar == null)
            Icon(Icons.person, size: 44.r, color: context.appColors.white),
          Column(
            spacing: 2.h,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user?.name ?? 'Unknown',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.appTextTheme.button1SemiBold.copyWith(
                  color: context.appColors.white,
                ),
              ),
              Text(
                user?.email ?? 'Unknown',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.appTextTheme.button2SemiBold.copyWith(
                  color: context.appColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      actionsPadding: EdgeInsets.only(right: 16.w),
      actions: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: context.appColors.backgroundColor,
                  title: Text(
                    'Logout',
                    style: context.appTextTheme.heading3SemiBold,
                  ),
                  content: Text(
                    'Are you sure you want to logout?',
                    style: context.appTextTheme.body2Regular,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'Cancel',
                        style: context.appTextTheme.button1SemiBold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthLogout());
                        context.pop();
                        context.pushReplacementNamed(RouteNames.login);
                      },
                      child: Text(
                        'Logout',
                        style: context.appTextTheme.button1SemiBold.copyWith(
                          color: context.appColors.red,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: SvgPicture.asset(
            AppImages.logoutIcon,
            height: 32.h,
            width: 32.w,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
