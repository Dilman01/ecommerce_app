import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/theme/app_theme.dart';
import 'package:flutter/material.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      themeMode: ThemeMode.dark,
      home: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: Container(
              height: 100,
              width: 100,
              color: context.appColors.buttonBgColor,
              child: Center(child: Text('Hello world!')),
            ),
          ),
        );
      }),
    );
  }
}
