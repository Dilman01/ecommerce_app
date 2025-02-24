import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/cubits/theme_cubit/theme_cubit.dart';
import 'package:ecommerce_app/core/di/init_dependencies.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:ecommerce_app/core/style/theme/app_theme.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(
          create:
              (context) => AuthBloc(
                userSignup: sl(),
                userLogin: sl(),
                userProfile: sl(),
              ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(360, 800),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              darkTheme: AppTheme.dark,
              theme: AppTheme.light,
              themeMode: state.themeMode,
              routerConfig: AppRouter().router,
            );
          },
        ),
      ),
    );
  }
}
