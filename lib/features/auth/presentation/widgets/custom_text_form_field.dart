import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.keyboardType,
    this.autovalidateMode = AutovalidateMode.onUnfocus,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
  });

  final TextEditingController controller;
  final String title;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enableSuggestions;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final TextCapitalization textCapitalization;

  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Row(
          children: [
            Text(
              title,
              style: context.appTextTheme.body2Medium,
            ),
            Text(
              '*',
              style: context.appTextTheme.body2Medium.copyWith(
                color: context.appColors.red,
              ),
            ),
          ],
        ),
        TextFormField(
          textCapitalization: textCapitalization,
          autovalidateMode: autovalidateMode,
          enableSuggestions: enableSuggestions,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: context.appTextTheme.captionRegular.copyWith(
              color: context.appColors.grey100,
            ),
            suffixIcon: suffixIcon,
            border: _border(context.appColors.grey100),
            focusedBorder: _border(context.appColors.cyan),
            errorBorder: _border(context.appColors.red),
            enabledBorder: _border(context.appColors.grey100),
          ),
          keyboardType: keyboardType,
          obscureText: obscureText,
          obscuringCharacter: '*',
          style: context.appTextTheme.captionRegular,
          validator: validator,
        ),
      ],
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12).r,
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
