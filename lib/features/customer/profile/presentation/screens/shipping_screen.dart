import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/shipping_form.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shipping Address',
          style: context.appTextTheme.body2Medium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ShippingForm(),
              SizedBox(height: 80.h),
              CustomButton(
                onPressed: () {
                  context.pop();
                },
                title: 'Save',
              ),
              SizedBox(height: 34.h),
            ],
          ),
        ),
      ),
    );
  }
}
