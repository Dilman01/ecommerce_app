import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Admin Home Screen',
          style: context.appTextTheme.heading1Bold,
        ),
      ),
    );
  }
}
