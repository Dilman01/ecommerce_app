import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              Text('Login', style: context.appTextTheme.heading2Bold),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: context.appTextTheme.body2Regular,
                  ),
                  InkWell(
                    onTap: () {
                      context.pushReplacementNamed(RouteNames.signup);
                    },
                    child: Text(
                      ' Signup ',
                      style: context.appTextTheme.body2Regular.copyWith(
                        color: context.appColors.cyan,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              const LoginForm(),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
