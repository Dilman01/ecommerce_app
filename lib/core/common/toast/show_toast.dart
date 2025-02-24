import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:ecommerce_app/core/style/colors/app_colors.dart';

class ShowToast {
  const ShowToast._();

  static void showToastErrorTop({required String message, int? seconds}) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: seconds ?? 3,
        backgroundColor: AppColors.red,
        textColor: AppColors.white,
        fontSize: 16.sp,
      );

  static void showToastSuccessTop({required String message, int? seconds}) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: seconds ?? 3,
        backgroundColor: AppColors.cyan,
        textColor: AppColors.white,
        fontSize: 16.sp,
      );
}
