import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthBloc>().user;

    return DrawerHeader(
      child: Column(
        children: [
          if (user != null && user.avatar != null)
            Container(
              height: 60.h,
              width: 60.w,
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
          Text(
            user?.name ?? 'Unknown',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.appTextTheme.button1SemiBold,
          ),
          Text(
            user?.email ?? 'Unknown',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.appTextTheme.button2SemiBold,
          ),
        ],
      ),
    );
  }
}
