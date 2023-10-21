import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/widget/custom_button.dart';
import 'package:ecommerce_app/widget/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_text.dart';
import '../../utils/dimensions.dart';
import '../../utils/style.dart';
import '../../widget/custom_back_button.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leadingWidth: 65.h,
        leading: Padding(
          padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT.w),
          child: const CustomBackButton(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal:Dimensions.PADDING_SIZE_DEFAULT.w),
        child:Column(
          children: [
            SizedBox(height:15.h,),
            Text(
              AppText.newPassword ,
              style: CustomTextStyle.customSize(
                  size: 28.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 186.h,),
            CustomTextFormField(
              label:AppText.password, 
            ),
            SizedBox(height: 10.h,),
            CustomTextFormField(
              label:AppText.confirmPassword,
            ),

            SizedBox(height: 80.h,),
            Text(AppText.pleaseWriteYourNewPassword,style:CustomTextStyle.h5(color: AppColors.greyColor),),

            SizedBox(height: 25.h,),

            CustomButton(text: AppText.resetPassword, onTap:(){

            }),
            SizedBox(height: 25.h,)








          ],
        ) ,
      ),
    );
  }
}
