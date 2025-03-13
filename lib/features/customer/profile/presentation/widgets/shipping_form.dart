import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/features/customer/profile/presentation/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/drop_down_widget.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/phone_number_field.dart';

class ShippingForm extends StatelessWidget {
  const ShippingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.h,
      children: [
        CustomTextField(title: 'Full Name', hintText: 'Enter full name'),
        PhoneNumberField(),
        DropDownWidget(),
        CustomTextField(
          title: 'Street Address',
          hintText: 'Enter street address',
        ),
        CustomTextField(title: 'Postal Code', hintText: 'Enter postal code'),
      ],
    );
  }
}
