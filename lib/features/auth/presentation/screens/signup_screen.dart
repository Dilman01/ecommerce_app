import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(context.assets.appIcon),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Signup', style: context.appTextTheme.heading2Bold),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    'Already have an account?',
                    style: context.appTextTheme.body2Regular,
                  ),
                  InkWell(
                    onTap: () {
                      context.pushReplacementNamed(RouteNames.login);
                    },
                    child: Text(
                      ' Login ',
                      style: context.appTextTheme.body2Regular.copyWith(
                        color: context.appColors.cyan,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              SignupForm(),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
