import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/common/cubits/theme_cubit/theme_cubit.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              darkTheme: AppTheme.dark,
              theme: AppTheme.light,
              themeMode: state.themeMode,
              home: Builder(
                builder: (context) {
                  final isDark = state.themeMode == ThemeMode.dark;
                  return Scaffold(
                    body: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 20,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Hello world!',
                                style: context.appTextTheme.heading1Bold,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Hello world!',
                                style: context.appTextTheme.heading1SemiBold,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Hello world!',
                                style: context.appTextTheme.heading1Regular,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Hello world!',
                                style: context.appTextTheme.heading2Bold,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Hello world!',
                                style: context.appTextTheme.heading2SemiBold,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Hello world!',
                                style: context.appTextTheme.heading2Regular,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Hello world!',
                                style: context.appTextTheme.heading3Bold,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Hello world!',
                                style: context.appTextTheme.heading3SemiBold,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Hello world!',
                                style: context.appTextTheme.heading3Regular,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                context.read<ThemeCubit>().toggleTheme();
                              },
                              icon: Icon(
                                isDark ? Icons.toggle_off : Icons.toggle_on,
                                color: context.appColors.buttonBgColor,
                                size: 40.r,
                              ),
                              label: Text('Dark Mode'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
