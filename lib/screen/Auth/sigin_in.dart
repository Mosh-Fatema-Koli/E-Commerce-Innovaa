import 'package:ecommerce_app/helper/routes.dart';
import 'package:ecommerce_app/helper/validator.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/widget/custom_text_from_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/auth/auth_controller.dart';
import '../../utils/app_text.dart';
import '../../utils/dimensions.dart';
import '../../utils/style.dart';
import '../../widget/custom_back_button.dart';
import '../../widget/custom_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _authController = Get.put(AuthController());

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
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
        child: Form(
          key: _authController.formKey,
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              Text(
                AppText.welCome,
                style: CustomTextStyle.customSize(
                    size: 28.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                AppText.pleaseEnterYourDataToContinue,
                style: CustomTextStyle.h4(color: AppColors.greyColor),
              ),

              SizedBox(
                height: 100.h,
              ),
              //<----------------- User Name Text----------->
              CustomTextFormField(
                label: AppText.emailAddress,
                controller: _authController.emailController.value,
                validator: Validators.emailValidator,
                suffixIcon: Icon(
                  Icons.check,
                  size: 20.h,
                  color: AppColors.switchColor,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              //<----------------- Password Text----------->
              Obx(() => CustomTextFormField(
                    label: AppText.password,
                    controller: _authController.passController.value,
                    obscureText: !_authController.isVisibility.value,
                    suffixIcon: InkWell(
                      onTap: () {
                        _authController.isVisibility.value =
                            !_authController.isVisibility.value;
                      },
                      child: Icon(
                        _authController.isVisibility.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: _authController.isVisibility.value
                            ? AppColors.switchColor
                            : AppColors.greyColor,
                      ),
                    ),
                  )),
              SizedBox(
                height: 25.h,
              ),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.forgotPassword);
                      },
                      child: Text(
                       "${AppText.forgotPassword}?",
                        style: CustomTextStyle.h4(color: AppColors.errorColor),
                      )),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppText.rememberMe,
                    style: CustomTextStyle.h4(fontWeight: FontWeight.w500),
                  ),
                  Obx(
                    () => SizedBox(
                      height: 25.h,
                      width: 38.w,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: CupertinoSwitch(
                          value: _authController.isRememberMe.value,
                          activeColor: AppColors.switchColor,
                          onChanged: (value) {
                            _authController.isRememberMe.value = value;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             // const Spacer(),
              SizedBox(height:80.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:5.w),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                    text:AppText.termDes,
                    style: CustomTextStyle.h5(color:AppColors.greyColor,height:1.4),
                    children: [
                      TextSpan(
                          text: AppText.termAndCondition,
                          style: CustomTextStyle.h5(fontWeight: FontWeight.w500,color: Theme.of(context).iconTheme.color)
                      )
                    ]
                )),
              ),
              SizedBox(
                height: 40.h,
              ),
              //<----------------- Sign up Button----------->

              CustomButton(text: AppText.logIn , onTap: () {

                if (_authController.formKey.currentState!.validate()) {
                  _authController.login();
                }

              }),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:5.w),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text:"Don't have you any account?",
                        style: CustomTextStyle.h5(color:AppColors.greyColor,height:1.4),
                        children: [
                          TextSpan(
                              text: "Sign Up",
                              style: CustomTextStyle.h5(fontWeight: FontWeight.w500,color: Theme.of(context).iconTheme.color)
                          )
                        ]
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
