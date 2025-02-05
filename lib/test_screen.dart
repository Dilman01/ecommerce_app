import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Test Screen',
          style: context.appTextTheme.heading1Bold,
        ),
      ),
    );
  }
}
