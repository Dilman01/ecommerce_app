import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password', style: context.appTextTheme.body2Medium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            spacing: 12.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                title: 'Old Password',
                hintText: 'Enter your old password',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye_outlined),
                ),
              ),
              CustomTextField(
                title: 'New Password',
                hintText: 'Enter your new password',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye_outlined),
                ),
              ),
              CustomTextField(
                title: 'Confirm Password',
                hintText: 'Confirm your password',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye_outlined),
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () {
                  context.pop();
                },
                title: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
