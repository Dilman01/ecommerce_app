import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('City', style: context.appTextTheme.body2Medium),
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
          child: DropdownMenu(
            width: 328.w,
            hintText: 'Select City',
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12).r,
                borderSide: BorderSide(color: context.appColors.grey50),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12).r,
                borderSide: BorderSide(color: context.appColors.grey50),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12).r,
                borderSide: BorderSide(color: context.appColors.grey50),
              ),
            ),
            trailingIcon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: context.appColors.arrowColor,
            ),
            selectedTrailingIcon: Icon(
              Icons.keyboard_arrow_up_rounded,
              color: context.appColors.arrowColor,
            ),
            menuStyle: MenuStyle(
              elevation: const WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(
                context.appColors.backgroundColor,
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12).r,
                  side: BorderSide(color: context.appColors.grey50),
                ),
              ),
            ),
            dropdownMenuEntries: [
              DropdownMenuEntry(
                value: 'Erbil',
                label: 'Erbil',
                style: ButtonStyle(
                  textStyle: WidgetStatePropertyAll(
                    context.appTextTheme.captionRegular,
                  ),
                ),
              ),
              DropdownMenuEntry(
                value: 'Sulaymaniyah',
                label: 'Sulaymaniyah',
                style: ButtonStyle(
                  textStyle: WidgetStatePropertyAll(
                    context.appTextTheme.captionRegular,
                  ),
                ),
              ),
              DropdownMenuEntry(
                value: 'Duhok',
                label: 'Duhok',
                style: ButtonStyle(
                  textStyle: WidgetStatePropertyAll(
                    context.appTextTheme.captionRegular,
                  ),
                ),
              ),
              DropdownMenuEntry(
                value: 'Kirkuk',
                label: 'Kirkuk',
                style: ButtonStyle(
                  textStyle: WidgetStatePropertyAll(
                    context.appTextTheme.captionRegular,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
