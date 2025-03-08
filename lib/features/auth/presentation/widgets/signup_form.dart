import 'package:ecommerce_app/core/common/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/toast/show_toast.dart';
import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_req_params.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/user_avatar_image.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool obscureText = true;
  bool isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLoading = true;
        } else if (state is AuthSuccess) {
          ShowToast.showToastSuccessTop(
            message: 'Account Created Successfully ✅, you can login now!',
            seconds: 5,
          );
          isLoading = false;
          context.pushReplacementNamed(RouteNames.login);
        } else if (state is AuthFailure) {
          isLoading = false;
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
              UserAvatarImage(),
              CustomTextFormField(
                controller: _nameController,
                title: 'Full Name',
                hintText: 'Enter your name',
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null ||
                      value.trim().length < 3 ||
                      value.trim().isEmpty) {
                    return 'Name must be at lease 3 characters.';
                  }

                  return null;
                },
              ),
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
                  final imageCubit = context.read<UploadImageCubit>();
                  if (!_formKey.currentState!.validate() ||
                      imageCubit.getImageUrl.isEmpty) {
                    if (imageCubit.getImageUrl.isEmpty) {
                      ShowToast.showToastErrorTop(
                        message: 'Please upload your avatar image.',
                      );
                    }
                  } else {
                    context.read<AuthBloc>().add(
                      AuthSignUp(
                        SignupReqParams(
                          name: _nameController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                          role: 'customer',
                          avatar: imageCubit.getImageUrl,
                        ),
                      ),
                    );
                  }
                },
                isLoading: isLoading,
                title: 'Create Account',
              ),
            ],
          ),
        );
      },
    );
  }
}
