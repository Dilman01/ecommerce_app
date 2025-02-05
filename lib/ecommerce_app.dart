import 'package:ecommerce_app/core/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/common/cubits/theme_cubit/theme_cubit.dart';
import 'package:ecommerce_app/core/style/theme/app_theme.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: ScreenUtilInit(
        designSize: Size(360, 800),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              darkTheme: AppTheme.dark,
              theme: AppTheme.light,
              themeMode: state.themeMode,
              routerConfig: router(),
            );
          },
        ),
      ),
    );
  }
}
