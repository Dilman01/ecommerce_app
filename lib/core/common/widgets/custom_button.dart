import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.size,
    this.icon,
    this.backgroundColor,
    this.textButtonColor,
    this.hasBorder = false,
  });

  final VoidCallback onPressed;
  final String title;
  final Size? size;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textButtonColor;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: size ?? Size(328.w, 60.h),
        backgroundColor: backgroundColor ?? context.appColors.buttonBgColor,
        elevation: 0,
        side: hasBorder
            ? BorderSide(
                color: context.appColors.grey50,
                width: 1,
              )
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12).r,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4.w,
        children: [
          Text(
            title,
            style: context.appTextTheme.button2SemiBold.copyWith(
              color: textButtonColor ?? context.appColors.white,
            ),
          ),
          if (icon != null) icon!
        ],
      ),
    );
  }
}
