import 'package:ecommerce_app/controller/auth/auth_controller.dart';
import 'package:ecommerce_app/helper/validator.dart';
import 'package:ecommerce_app/utils/app_text.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:ecommerce_app/widget/custom_back_button.dart';
import 'package:ecommerce_app/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widget/custom_text_from_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
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
              //<----------------- Sign up Text----------->
              Text(
                AppText.signUp,
                style: CustomTextStyle.customSize(
                    size: 28.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 100.h,
              ),
              //<----------------- User Name Text----------->
              CustomTextFormField(
                label: AppText.name,
                validator: Validators.nameValidator,
                controller: _authController.nameRegController.value,
                suffixIcon: Icon(
                  Icons.check,
                  size: 20.h,
                  color: AppColors.switchColor,
                ),
              ),
              CustomTextFormField(
                label: AppText.emailAddress,
                validator: Validators.emailValidator,
                controller: _authController.emailRegController.value,
                suffixIcon: Icon(
                  Icons.check,
                  size: 20.h,
                  color: AppColors.switchColor,
                ),
              ),
              CustomTextFormField(
                label: AppText.phone,
                keyboardType: TextInputType.number,
                validator: Validators.phoneValidator,
                controller: _authController.phoneController.value,
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
                    validator: Validators.passValidator,
                    controller: _authController.passRegController.value,
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
              Obx(() => CustomTextFormField(
                label: AppText.conPassword,
                controller: _authController.confirmPassRegController.value,
                validator: Validators.passValidator,
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
                height: 10.h,
              ),
              //<----------------- Email Address Text----------->

              SizedBox(
                height: 40.h,
              ),
              //<----------------- Remember me----------->
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppText.rememberMe,style:CustomTextStyle.h4(fontWeight: FontWeight.w500),),

                  Obx(()=>
                     SizedBox(
                      height: 25.h,
                      width: 38.w,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: CupertinoSwitch(
                          value: _authController.isRememberMe.value,
                          activeColor: AppColors.switchColor,
                          onChanged: (value) {
                            _authController.isRememberMe.value=value;

                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              //<----------------- Sign up Button----------->

              CustomButton(text: AppText.signUp, onTap: (){

                if (_authController.formKey.currentState!.validate()) {
                  _authController.registration();
                }

              })

            ],
          ),
        ),
      ),
    );
  }
}
