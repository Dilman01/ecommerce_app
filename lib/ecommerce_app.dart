import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/common/cubits/theme_cubit/theme_cubit.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/theme/app_theme.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
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
                    child: Column(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: context.appColors.cyan,
                          child: Center(child: Text('Hello world!')),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            context.read<ThemeCubit>().toggleTheme();
                          },
                          icon: Icon(
                            isDark ? Icons.toggle_off : Icons.toggle_on,
                            color: context.appColors.buttonBgColor,
                          ),
                          label: Text('Dark Mode'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
