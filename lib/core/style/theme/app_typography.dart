import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/style/fonts/font_family_helper.dart';

class AppTypography {
  AppTypography._();

  static final heading1Bold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    height: 1.2,
    letterSpacing: 0,
  );

  static final heading1SemiBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    height: 1.2,
    letterSpacing: 0,
  );

  static final heading1Regular = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    height: 1.2,
    letterSpacing: 0,
  );

  static final heading2Bold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    height: 1.2,
    letterSpacing: 0,
  );

  static final heading2SemiBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    height: 1.2,
    letterSpacing: 0,
  );

  static final heading2Regular = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    height: 1.2,
    letterSpacing: 0,
  );

  static final heading3Bold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    height: 1.2,
    letterSpacing: 0.25,
  );

  static final heading3SemiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    height: 1.2,
    letterSpacing: 0.25,
  );

  static final heading3Regular = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    height: 1.2,
    letterSpacing: 0.25,
  );

  static final button1SemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    letterSpacing: 0,
  );

  static final button2SemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    letterSpacing: 0,
  );

  static final body1Medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static final body1Regular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static final body2Medium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static final body2Regular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static final captionSemiBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    letterSpacing: 0.5,
  );

  static final captionRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    letterSpacing: 0.5,
  );

  static final overlineSemiBold = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    letterSpacing: 1.5,
  );

  static final overlineRegular = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamilyHelper.plusJakartaSans,
    letterSpacing: 1.5,
  );
}
