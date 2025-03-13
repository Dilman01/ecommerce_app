import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.width,
  });

  final String title;
  final String hintText;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Row(
          children: [
            Text(title, style: context.appTextTheme.body2Medium),
            Text(
              '*',
              style: context.appTextTheme.body2Medium.copyWith(
                color: context.appColors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 60.h,
          width: width,
          child: TextField(
            cursorColor: context.appColors.arrowColor,
            decoration: InputDecoration(
              hintText: hintText,
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
            textCapitalization: TextCapitalization.words,
            style: context.appTextTheme.captionRegular,
          ),
        ),
      ],
    );
  }
}
