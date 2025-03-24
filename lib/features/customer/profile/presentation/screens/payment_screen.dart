import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/payment_form.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method', style: context.appTextTheme.body2Medium),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PaymentForm(),
              SizedBox(height: 160.h),
              CustomButton(
                onPressed: () {
                  context.pop();
                },
                title: 'Save',
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
