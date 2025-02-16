import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.onTap, required this.title});

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: context.appTextTheme.heading3Bold),
        InkWell(
          onTap: onTap,
          child: Text(
            'SEE ALL',
            style: context.appTextTheme.overlineSemiBold.copyWith(
              color: context.appColors.cyan,
            ),
          ),
        ),
      ],
    );
  }
}
