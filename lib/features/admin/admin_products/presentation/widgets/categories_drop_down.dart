import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/entity/admin_category_entity.dart';

class CategoriesDropDown extends StatelessWidget {
  const CategoriesDropDown({
    super.key,
    required this.categories,
    required this.onSelected,
    this.initialSelection,
  });

  final List<AdminCategoryEntity> categories;
  final void Function(String? value)? onSelected;
  final String? initialSelection;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Category', style: context.appTextTheme.body2Medium),
            Text(
              '*',
              style: context.appTextTheme.body2Medium.copyWith(
                color: context.appColors.red,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 60.h,
          child: DropdownMenu(
            width: 328.w,
            hintText: 'Select A Category',
            initialSelection: initialSelection,
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: context.appTextTheme.captionRegular.copyWith(
                color: context.appColors.grey150,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12).r,
                borderSide: BorderSide(color: context.appColors.grey50),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12).r,
                borderSide: BorderSide(color: context.appColors.grey50),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12).r,
                borderSide: BorderSide(color: context.appColors.grey50),
              ),
            ),
            trailingIcon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: context.appColors.arrowColor,
            ),
            selectedTrailingIcon: Icon(
              Icons.keyboard_arrow_up_rounded,
              color: context.appColors.arrowColor,
            ),
            menuStyle: MenuStyle(
              elevation: const WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(
                context.appColors.backgroundColor,
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12).r,
                  side: BorderSide(color: context.appColors.grey50),
                ),
              ),
            ),
            onSelected: onSelected,
            dropdownMenuEntries:
                categories
                    .map(
                      (e) => DropdownMenuEntry(
                        value: e.name ?? 'Unknown',
                        label: e.name ?? 'Unknown',
                        style: ButtonStyle(
                          textStyle: WidgetStatePropertyAll(
                            context.appTextTheme.captionRegular,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
