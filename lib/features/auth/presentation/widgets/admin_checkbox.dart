import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AdminCheckbox extends StatefulWidget {
  const AdminCheckbox({super.key, required this.onChanged});

  final void Function(bool?)? onChanged;

  @override
  State<AdminCheckbox> createState() => _AdminCheckboxState();
}

class _AdminCheckboxState extends State<AdminCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          activeColor: context.appColors.cyan,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
            widget.onChanged!(value);
          },
        ),
        Text('Sign up as Admin', style: context.appTextTheme.captionSemiBold),
      ],
    );
  }
}
