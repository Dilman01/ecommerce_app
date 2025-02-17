import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
          Container(
            height: 44.h,
            width: 44.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8).r,
              image: DecorationImage(
                image: NetworkImage(
                  'https://fifpro.org/media/5chb3dva/lionel-messi_imago1019567000h.jpg?rxy=0.32986930611281567,0.18704579979466449&rnd=133378758718600000',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            spacing: 2.h,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dilman Arif',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.appTextTheme.button1SemiBold.copyWith(
                  color: context.appColors.white,
                ),
              ),
              Text(
                'dilmandev@gmail.com',
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
          onTap: () {},
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
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
}
