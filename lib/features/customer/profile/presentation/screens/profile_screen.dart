import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/profile_app_bar.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/widgets/setting_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> privacyContent = [
      Text('Our Policy', style: context.appTextTheme.heading2Bold),
      Text(
        'At QuickMart, we are committed to protecting the privacy and security of our users\' personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard the information obtained through our e-commerce app. By using QuickMart, you consent to the practices described in this policy.',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      SizedBox(height: 8.h),
      Text(
        '1. Information Collection:',
        style: context.appTextTheme.body2Medium,
      ),
      Text(
        '''   - Personal Information: We may collect personal information such as name, address, email, and phone number when you create an account, make a purchase, or interact with our services.
   - Transaction Details: We collect information related to your purchases, including order history, payment method, and shipping details.
   - Usage Data: We may collect data on how you interact with our app, such as browsing activity, search queries, and preferences.
''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text('2. Information Use:', style: context.appTextTheme.body2Medium),
      Text(
        '''   - Provide Services: We use the collected information to process orders, deliver products, and provide customer support.
   - Personalization: We may use your information to personalize your shopping experience, recommend products, and display targeted advertisements.
   - Communication: We may use your contact information to send important updates, promotional offers, and newsletters. You can opt-out of these communications at any time.
''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text('3. Information Sharing:', style: context.appTextTheme.body2Medium),
      Text(
        '''   - Third-Party Service Providers: We may share your information with trusted third-party service providers who assist us in operating our app, fulfilling orders, and improving our services.
   - Legal Compliance: We may disclose personal information if required by law or in response to a valid legal request from authorities.
''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text('4. Data Security:', style: context.appTextTheme.body2Medium),
      Text(
        '''   - We implement appropriate security measures to protect your information from unauthorized access, alteration, disclosure, or destruction.
   - However, please note that no data transmission over the internet or electronic storage is 100% secure. We cannot guarantee absolute security of your information.
''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text('5. User Rights:', style: context.appTextTheme.body2Medium),
      Text(
        '''   - Access and Update: You have the right to access, correct, or update your personal information stored in our app.
   - Data Retention: We retain your personal information as long as necessary to provide our services and comply with legal obligations.
''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text('6. Children\'s Privacy:', style: context.appTextTheme.body2Medium),
      Text(
        '''   - QuickMart is not intended for children under the age of 13. We do not knowingly collect or solicit personal information from children.
''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text(
        '7. Updates to the Privacy Policy:',
        style: context.appTextTheme.body2Medium,
      ),
      Text(
        '''   - We reserve the right to update this Privacy Policy from time to time. Any changes will be posted on our app, and the revised policy will be effective upon posting.

If you have any questions or concerns about our Privacy Policy, please contact our customer support. By using QuickMart, you acknowledge that you have read and understood this Privacy Policy and agree to its terms and conditions.''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      SizedBox(height: 24.h),
    ];

    final List<Widget> termsContent = [
      Text('Terms & Conditions', style: context.appTextTheme.heading2Bold),
      Text(
        'Welcome to QuickMart! These Terms and Conditions ("Terms") govern your use of our e-commerce app. By accessing or using QuickMart, you agree to be bound by these Terms. Please read them carefully before proceeding.',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      SizedBox(height: 8.h),
      Text('1. Account Registration:', style: context.appTextTheme.body2Medium),
      Text(
        '''   - You must create an account to use certain features of QuickMart.
   - You are responsible for providing accurate and up-to-date information during the registration process.
   - You must safeguard your account credentials and notify us immediately of any unauthorized access or use of your account.
''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text(
        '2. Product Information and Pricing:',
        style: context.appTextTheme.body2Medium,
      ),
      Text(
        '''   - QuickMart strives to provide accurate product descriptions, images, and pricing information.
   - We reserve the right to modify product details and prices without prior notice.
   - In the event of an error, we may cancel or refuse orders placed for incorrectly priced products.''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text(
        '3. Order Placement and Fulfillment:',
        style: context.appTextTheme.body2Medium,
      ),
      Text(
        '''   - By placing an order on QuickMart, you agree to purchase the selected products at the stated price.
   - We reserve the right to accept or reject any order, and we may cancel orders due to product unavailability, pricing errors, or suspected fraudulent activity.
   - Once an order is confirmed, we will make reasonable efforts to fulfill and deliver it in a timely manner.
''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text('4. Payment:', style: context.appTextTheme.body2Medium),
      Text(
        '''   - QuickMart supports various payment methods, including credit/debit cards and online payment platforms.
   - By providing payment information, you represent and warrant that you are authorized to use the chosen payment method.
   - All payments are subject to verification and approval by relevant financial institutions.''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text(
        '5. Shipping and Delivery:',
        style: context.appTextTheme.body2Medium,
      ),
      Text(
        '''   - QuickMart will make reasonable efforts to ensure timely delivery of products.
   - Shipping times may vary based on factors beyond our control, such as location, weather conditions, or carrier delays.
   - Risk of loss or damage to products passes to you upon delivery.
''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text('6. Returns and Refunds:', style: context.appTextTheme.body2Medium),
      Text(
        '''   - QuickMart's return and refund policies are outlined separately and govern the process for returning products and seeking refunds.
   - Certain products may be non-returnable or subject to specific conditions.
''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text(
        '7. Intellectual Property:',
        style: context.appTextTheme.body2Medium,
      ),
      Text(
        '''   - QuickMart and its content, including logos, trademarks, text, images, and software, are protected by intellectual property rights.
   - You may not use, reproduce, modify, distribute, or display any part of QuickMart without our prior written consent.
   ''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text('8. User Conduct:', style: context.appTextTheme.body2Medium),
      Text(
        '''   - You agree to use QuickMart in compliance with applicable laws and regulations.
   - You will not engage in any activity that disrupts or interferes with the functioning of QuickMart or infringes upon the rights of others.
   - Any unauthorized use or attempt to access restricted areas or user accounts is strictly prohibited.
''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text(
        '9. Limitation of Liability:',
        style: context.appTextTheme.body2Medium,
      ),
      Text(
        '''   - QuickMart and its affiliates shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising from the use or inability to use our app or any products purchased through it.
   - We do not guarantee the accuracy, completeness, or reliability of information provided on QuickMart.
   ''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      Text('10. Governing Law:', style: context.appTextTheme.body2Medium),
      Text(
        '''    - These Terms shall be governed by and construed in accordance with the laws of [Jurisdiction].
    - Any disputes arising out of or relating to these Terms shall be resolved in the courts of [Jurisdiction].

If you have any questions or concerns regarding these Terms and Conditions, please contact our customer support. By using QuickMart, you acknowledge that you have read, understood, and agreed to these Terms and Conditions.
''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      SizedBox(height: 24.h),
    ];

    final List<Widget> faqsContent = [
      Text('Can I cancel my order?', style: context.appTextTheme.body2Medium),
      Text(
        '''Yes only if the order is not dispatched yet. You can contact our customer service department to get your order canceled.''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      SizedBox(height: 12.h),
      Text(
        'Will I receive the same product I see in the photo?',
        style: context.appTextTheme.body2Medium,
      ),
      Text(
        '''Actual product color may vary from the images shown. Every monitor or mobile display has a different capability to display colors, and every individual may see these colors differently. In addition, lighting conditions at the time the photo was taken can also affect an image's color.''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      SizedBox(height: 12.h),
      Text(
        'How can I recover the forgotten password?',
        style: context.appTextTheme.body2Medium,
      ),
      Text(
        '''If you have forgotten your password, you can recover it from "Login - Forgotten your password?" section. You will receive an e-mail with a link to enter and confirm your new password.''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      SizedBox(height: 12.h),
      Text(
        'Is my personal information confidential?',
        style: context.appTextTheme.body2Medium,
      ),
      Text(
        '''Your personal information is confidential. We do not rent, sell, barter or trade email addresses. When you place an order with us, we collect your name, address, telephone number, credit card information and your email address. We use this information to fulfill your order and to communicate with you about your order. All your information is kept confidential and will not be disclosed to anybody unless ordered by government authorities.''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      SizedBox(height: 12.h),
      Text(
        'What payment methods can I use to make purchases?',
        style: context.appTextTheme.body2Medium,
      ),
      Text(
        '''We offer the following payment methods: PayPal, VISA, MasterCard and Voucher code, if applicable.''',
        style: context.appTextTheme.body2Medium.copyWith(
          color: context.appColors.grey150,
        ),
      ),
      SizedBox(height: 24.h),
    ];

    return Scaffold(
      appBar: ProfileAppBar(),
      backgroundColor: context.appColors.cyan,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 4.h),
        padding: EdgeInsets.symmetric(vertical: 24.h),
        decoration: BoxDecoration(
          color: context.appColors.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24).r,
            topRight: Radius.circular(24).r,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Personal Information',
                      style: context.appTextTheme.captionSemiBold,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  SettingItem(
                    onTap: () {
                      context.pushNamed(RouteNames.shipping);
                    },
                    title: 'Shipping Address',
                    iconPath: AppImages.shippingIcon,
                  ),
                  SizedBox(height: 14.h),
                  SettingItem(
                    onTap: () {
                      context.pushNamed(RouteNames.payment);
                    },
                    title: 'Payment Method',
                    iconPath: AppImages.paymentIcon,
                  ),
                  SizedBox(height: 14.h),
                  SettingItem(
                    onTap: () {},
                    title: 'Order History',
                    iconPath: AppImages.orderHistoryIcon,
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Support & Information',
                      style: context.appTextTheme.captionSemiBold,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  SettingItem(
                    onTap: () {
                      context.pushNamed(
                        RouteNames.support,
                        pathParameters: {'title': 'Privacy Policy'},
                        extra: privacyContent,
                      );
                    },
                    title: 'Privacy Policy',
                    iconPath: AppImages.privacyIcon,
                  ),
                  SizedBox(height: 14.h),
                  SettingItem(
                    onTap: () {
                      context.pushNamed(
                        RouteNames.support,
                        pathParameters: {'title': 'Terms & Conditions'},
                        extra: termsContent,
                      );
                    },
                    title: 'Terms & Conditions',
                    iconPath: AppImages.termsIcon,
                  ),
                  SizedBox(height: 14.h),
                  SettingItem(
                    onTap: () {
                      context.pushNamed(
                        RouteNames.support,
                        pathParameters: {'title': 'FAQs'},
                        extra: faqsContent,
                      );
                    },
                    title: 'FAQs',
                    iconPath: AppImages.faqsIcon,
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Account Management',
                      style: context.appTextTheme.captionSemiBold,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  SettingItem(
                    onTap: () {
                      context.pushNamed(RouteNames.changePassword);
                    },
                    title: 'Change Password',
                    iconPath: AppImages.changePasswordIcon,
                  ),
                  SizedBox(height: 14.h),
                  SettingItem(
                    onTap: () {},
                    isThemeToggle: true,
                    title: 'Dark Theme',
                    iconPath: AppImages.themeIcon,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
