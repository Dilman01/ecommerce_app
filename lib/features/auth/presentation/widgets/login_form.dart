import 'package:ecommerce_app/core/common/toast/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/features/auth/data/model/login_req_params.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:logger/logger.dart';

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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          // context.pushReplacementNamed(RouteNames.login);
        } else if (state is AuthFailure) {
          Logger().f(state.message);
          ShowToast.showToastErrorTop(message: state.message);
        }
      },
      builder: (context, state) {
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
                  if (value == null ||
                      value.length < 6 ||
                      value.trim().isEmpty) {
                    return 'Password must be at least 6 characters.';
                  }

                  return null;
                },
              ),
              SizedBox(height: 8.h),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                      AuthLogin(
                        LoginReqParams(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        ),
                      ),
                    );
                  }
                },
                title: 'Login',
              ),
            ],
          ),
        );
      },
    );
  }
}
