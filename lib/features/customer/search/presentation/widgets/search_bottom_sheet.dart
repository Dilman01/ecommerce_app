import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  double start = 0;
  double end = 100;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: context.appColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24).r,
          topRight: Radius.circular(24).r,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price Range', style: context.appTextTheme.body1Medium),
          RangeSlider(
            values: RangeValues(start, end),
            min: 0,
            max: 100,
            activeColor: context.appColors.cyan,
            labels: RangeLabels('${start.round()}', '${end.round()}'),
            divisions: 100,
            onChanged: (value) {
              setState(() {
                start = value.start;
                end = value.end;
              });
            },
          ),
          CustomButton(onPressed: () {}, title: 'Apply'),
        ],
      ),
    );
  }
}
