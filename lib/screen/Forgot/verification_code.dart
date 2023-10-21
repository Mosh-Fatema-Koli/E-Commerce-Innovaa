import 'package:ecommerce_app/controller/verification_controller.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../helper/routes.dart';
import '../../utils/app_text.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../utils/style.dart';
import '../../widget/custom_back_button.dart';

class VerificationCodeScreen extends StatelessWidget {
   VerificationCodeScreen({super.key});
  final _verificationController=Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    _verificationController.startTimer();
   // const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);


    final defaultPinTheme = PinTheme(
      width:77.w,
      height: 98.h,
      textStyle:  TextStyle(
        fontSize: 22.sp,

      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color:AppColors.borderColor),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 65.h,
        leading: Padding(
          padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT.w),
          child: const CustomBackButton(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal:20.w),
        child: Column(
           children: [
             SizedBox(height:15.h,),
             Text(
               AppText.verificationCode,
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
             SizedBox(height:60.h,),
             Directionality(
               // Specify direction if desired
               textDirection: TextDirection.ltr,
               child: Pinput(
                 controller:_verificationController.pinController,
                 focusNode:_verificationController.focusNode,
                 defaultPinTheme: defaultPinTheme,
                 // validator: (value) {
                 //   return value == '2222' ? null : 'Pin is incorrect';
                 // },
                 // onClipboardFound: (value) {
                 //   debugPrint('onClipboardFound: $value');
                 //   pinController.setText(value);
                 // },
                 hapticFeedbackType: HapticFeedbackType.lightImpact,
                 onCompleted: (pin) {

                   debugPrint('onCompleted: $pin');
                 },
                 onChanged: (value) {
                   debugPrint('onChanged: $value');
                 },


               ),
             ),

             SizedBox(height:60.h,),
             Obx(
                   () => RichText(
                   text: TextSpan(
                       text: " ${_verificationController.timeShow.value}",
                       style: CustomTextStyle.h5(fontWeight: FontWeight.w500,),

                       children: [
                         TextSpan(
                           text:AppText.resendConfirmationCode,
                           style: CustomTextStyle.h5(color: AppColors.greyColor),


                         ),

                       ])),
             ),
             SizedBox(height: 25.h,),
             CustomButton(text: AppText.confirmCode, onTap: (){
               Get.toNamed(Routes.resetPassword);
             })

           ],
        ),
      ),
    );
  }
}
