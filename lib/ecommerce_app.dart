import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/app/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:ecommerce_app/core/common/app/theme_cubit/theme_cubit.dart';
import 'package:ecommerce_app/core/common/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ecommerce_app/core/di/init_dependencies.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:ecommerce_app/core/style/theme/app_theme.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_app/features/customer/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/customer/wishlist/presentation/cubit/wishlist_cubit.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<InternetConnectionCubit>()),
        BlocProvider(create: (context) => sl<ThemeCubit>()),
        BlocProvider(create: (context) => sl<UploadImageCubit>()),
        BlocProvider(create: (context) => sl<AuthBloc>()),
        BlocProvider(create: (context) => sl<CartBloc>()),
        BlocProvider(create: (context) => sl<WishlistCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                AppRouter().router.refresh();
              },
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                darkTheme: AppTheme.dark,
                theme: AppTheme.light,
                themeMode: state.themeMode,
                routerConfig: AppRouter().router,
              ),
            );
          },
        ),
      ),
    );
  }
}
