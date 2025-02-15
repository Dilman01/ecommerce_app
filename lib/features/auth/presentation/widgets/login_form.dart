import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          CustomTextFormField(
            controller: _emailController,
            title: 'Email',
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null ||
                  !value.contains('@') ||
                  value.trim().isEmpty) {
                return 'Invalid email.';
              }

              return null;
            },
          ),
          CustomTextFormField(
            controller: _passwordController,
            title: 'Password',
            hintText: 'Enter your password',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(Icons.remove_red_eye_outlined),
            ),
            obscureText: obscureText,
            enableSuggestions: false,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.length < 6 || value.trim().isEmpty) {
                return 'Password must be at least 6 characters.';
              }

              return null;
            },
          ),
          SizedBox(height: 8.h),
          CustomButton(
            onPressed: () {
              _formKey.currentState!.validate();
            },
            title: 'Login',
          ),
        ],
      ),
    );
  }
}
