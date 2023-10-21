import 'package:ecommerce_app/helper/routes.dart';
import 'package:ecommerce_app/utils/images.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:ecommerce_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_text.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widget/custom_back_button.dart';
import '../../widget/custom_text_from_field.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leadingWidth: 65.h,
      leading: Padding(
        padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT.w),
        child: const CustomBackButton(),
      ),
    ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal:Dimensions.PADDING_SIZE_DEFAULT.w),
          child: Column(
            children: [
              SizedBox(height:15.h,),
              Text(
                AppText.forgotPassword,
                style: CustomTextStyle.customSize(
                    size: 28.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height:60.h,),
              Image.asset(
                AppImage.forgotPass,
                fit: BoxFit.fill,
                height: 166.h,
                width: 225.w,
              ),
              SizedBox(height:70.h,),
              //<----------------- Email Address Text----------->
              CustomTextFormField(
                label: AppText.emailAddress,
                suffixIcon: Icon(
                  Icons.check,
                  size: 20.h,
                  color: AppColors.switchColor,
                ),
              ),
              SizedBox(height: 150.h,),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal:30.w ),
                child: Text(AppText.forgotDes,textAlign:TextAlign.center,style: CustomTextStyle.h5(color: AppColors.greyColor),),
              ),

              SizedBox(height: 25.h,),
              CustomButton(text: AppText.confirmMail, onTap: (){
                Get.toNamed(Routes.verificationScreen);

              }),
              SizedBox(height: 25.h,),


            ],
          ),
        ),
      ),

    );
  }
}
