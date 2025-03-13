import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ecommerce_app/core/common/widgets/custom_button.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/customer/checkout/presentation/widgets/review_content.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/payment_form.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/shipping_form.dart';
import 'package:go_router/go_router.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout', style: context.appTextTheme.body2Medium),
        elevation: 0,
        centerTitle: false,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          canvasColor: context.appColors.backgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.zero,
          child: Stepper(
            type: StepperType.horizontal,
            elevation: 0,
            currentStep: currentStep,
            stepIconMargin: EdgeInsets.zero,
            connectorThickness: 1,
            connectorColor: WidgetStatePropertyAll(context.appColors.grey100),
            stepIconBuilder: (stepIndex, stepState) => SizedBox.shrink(),
            controlsBuilder:
                (context, details) => CustomButton(
                  onPressed: () {
                    if (details.currentStep == 0) {
                      setState(() {
                        currentStep++;
                      });
                    } else if (details.currentStep == 1) {
                      setState(() {
                        currentStep++;
                      });
                    } else {
                      context.pushNamed(RouteNames.orderSuccess);
                    }
                  },
                  title:
                      details.currentStep == 0
                          ? 'Save'
                          : details.currentStep == 1
                          ? 'Continue'
                          : 'Place Order',
                ),
            onStepTapped:
                (value) => setState(() {
                  currentStep = value;
                }),
            steps: [
              Step(
                title: Container(
                  margin: EdgeInsets.only(right: 16.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        currentStep > 0
                            ? AppImages.shippingCompleteIcon
                            : AppImages.shippingIcon,
                        colorFilter: ColorFilter.mode(
                          currentStep == 0
                              ? context.appColors.arrowColor
                              : currentStep > 0
                              ? context.appColors.cyan
                              : context.appColors.grey150,
                          BlendMode.srcIn,
                        ),
                        height: 24.h,
                        width: 24.w,
                      ),
                      Text(
                        'Shipping',
                        style: context.appTextTheme.captionSemiBold.copyWith(
                          color:
                              currentStep == 0
                                  ? context.appColors.arrowColor
                                  : currentStep > 0
                                  ? context.appColors.cyan
                                  : context.appColors.grey150,
                        ),
                      ),
                    ],
                  ),
                ),
                isActive: currentStep == 0,
                stepStyle: StepStyle(color: Colors.transparent),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ShippingForm(), SizedBox(height: 12.h)],
                ),
              ),
              Step(
                title: Container(
                  margin: EdgeInsets.only(right: 18.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        currentStep > 1
                            ? AppImages.paymentCompleteIcon
                            : AppImages.paymentIcon,
                        colorFilter: ColorFilter.mode(
                          currentStep == 1
                              ? context.appColors.arrowColor
                              : currentStep > 1
                              ? context.appColors.cyan
                              : context.appColors.grey150,
                          BlendMode.srcIn,
                        ),
                      ),
                      Text(
                        'Payment',
                        style: context.appTextTheme.captionSemiBold.copyWith(
                          color:
                              currentStep == 1
                                  ? context.appColors.arrowColor
                                  : currentStep > 1
                                  ? context.appColors.cyan
                                  : context.appColors.grey150,
                        ),
                      ),
                    ],
                  ),
                ),
                isActive: currentStep == 1,
                stepStyle: StepStyle(color: Colors.transparent),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [PaymentForm(), SizedBox(height: 30.h)],
                ),
              ),
              Step(
                title: Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        AppImages.reviewIcon,
                        colorFilter: ColorFilter.mode(
                          currentStep == 2
                              ? context.appColors.arrowColor
                              : currentStep > 2
                              ? context.appColors.cyan
                              : context.appColors.grey150,
                          BlendMode.srcIn,
                        ),
                      ),
                      Text(
                        'Review',
                        style: context.appTextTheme.captionSemiBold.copyWith(
                          color:
                              currentStep == 2
                                  ? context.appColors.arrowColor
                                  : currentStep > 2
                                  ? context.appColors.cyan
                                  : context.appColors.grey150,
                        ),
                      ),
                    ],
                  ),
                ),
                isActive: currentStep == 2,
                stepStyle: StepStyle(color: Colors.transparent),
                content: ReviewContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
