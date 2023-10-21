import 'package:ecommerce_app/helper/routes.dart';
import 'package:ecommerce_app/utils/app_text.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/icons.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widget/custom_back_button.dart';
import '../../widget/custom_button.dart';
import 'components/social_media_button.dart';

class LetsGetStart extends StatelessWidget {
  const LetsGetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 65.h,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: const CustomBackButton(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),

            Text(
              AppText.letsGetStarted,
              style: CustomTextStyle.customSize(
                  size: 28.sp,
                  fontWeight: FontWeight.w600,
                 ),
            ),
            SizedBox(
              height: 185.h,
            ),
            // <--------------- SocialMedia  Button-------------->
            SocialMediaButton(
              text: AppText.google,
              icon: AppIcons.google,
              color: const Color(0xFFEA4335),
              onTab: () {
                Get.toNamed(Routes.navBarScreen);
              },
            ),
            SizedBox(
              height: 14.h,
            ),
            SocialMediaButton(
              text: AppText.faceBook,
              icon: AppIcons.faceBook,
              color: const Color(0xFF4267B2),
              onTab: () {
               // Get.toNamed(Routes.navBarScreen);
              },
            ),




            const Spacer(),

            // <---------------  Already Have an Account-------------->
            RichText(
                text: TextSpan(
                    text: AppText.alreadyHaveAnAccount,
                    style: CustomTextStyle.h4(color: AppColors.greyColor),
                    children: [
                  TextSpan(
                      text: AppText.signIn,
                      style: CustomTextStyle.h4(
                          fontWeight: FontWeight.w500,
                        color:Theme.of(context).iconTheme.color,
                         ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(Routes.signInScreen);
                        })
                ])),
            SizedBox(
              height: 25.h,
            ),
            // <---------------  Create an account Button-------------->
            CustomButton(
              onTap: () {
                Get.toNamed(Routes.signUpScreen);
              },
              text: AppText.createAnAccount,
            ),

            SizedBox(
              height: 25.h,
            ),
          ],
        ),
      ),
    );
  }
}
