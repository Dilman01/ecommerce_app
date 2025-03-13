import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Phone Number', style: context.appTextTheme.body2Medium),
            Text(
              '*',
              style: context.appTextTheme.body2Medium.copyWith(
                color: context.appColors.red,
              ),
            ),
          ],
        ),
        Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.of(
              context,
            ).copyWith(primary: context.appColors.cyan),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: context.appColors.arrowColor,
            ),
          ),
          child: SizedBox(
            height: 60.h,
            child: InternationalPhoneNumberInput(
              onInputChanged: (value) {},
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.DIALOG,
              ),
              selectorTextStyle: context.appTextTheme.captionRegular,
              textStyle: context.appTextTheme.captionRegular,
              cursorColor: context.appColors.arrowColor,
              initialValue: PhoneNumber(isoCode: 'IQ'),
              keyboardType: TextInputType.numberWithOptions(
                signed: true,
                decimal: true,
              ),
              inputBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12).r,
                borderSide: BorderSide(color: context.appColors.grey50),
              ),
              inputDecoration: InputDecoration(
                hintText: '123456789',
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
            ),
          ),
        ),
      ],
    );
  }
}
