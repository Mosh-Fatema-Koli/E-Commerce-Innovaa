import 'package:ecommerce_app/controller/splash_controller.dart';
import 'package:ecommerce_app/controller/theme_controller.dart';
import 'package:ecommerce_app/helper/routes.dart';
import 'package:ecommerce_app/helper/share_pref_helper.dart';
import 'package:ecommerce_app/utils/app_text.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/images.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardScreen extends StatelessWidget {
   OnBoardScreen({super.key});
    final _splashController =Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(()=>
         Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Get.find<ThemeController>().isDarkTheme.value?AppImage.darkOnboardBg :AppImage.onboardBg), fit: BoxFit.fill)),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(AppImage.onboard),
              Positioned(
                  bottom: 15.h,
                  child: Container(
                    width: 345.w,
                    height: 244.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color:Get.find<ThemeController>().isDarkTheme.value?const Color(0xFF29363D):Color(0xFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height:10.h,),
                        Text(AppText.lookGoodFeelGood,style:CustomTextStyle.customSize(size:25.sp,fontWeight:FontWeight.w600,height:1.1),),
                        SizedBox(height:10.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 25.w),
                          child: Text(AppText.onboardDes,style: CustomTextStyle.h4(height:1.4,),textAlign: TextAlign.center,),
                        ),
                        SizedBox(height:10.h,),
                        Obx(()=>
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _button(_splashController.isWomen.value?Theme.of(context).secondaryHeaderColor: AppColors.mainColor,_splashController.isWomen.value?AppColors.greyColor:AppColors.bgColor,() async {
                                _splashController.isWomen.value=false;
                                _splashController.isFirstTime.value = true;
                                Get.offNamed(Routes.navBarScreen);
                                await   PrefsHelper.setBool(AppConstant.isFirstTime, _splashController.isFirstTime.value);
                              },"Men"),
                             SizedBox(width:10.w,),
                              _button(_splashController.isWomen.value? AppColors.mainColor:Theme.of(context).secondaryHeaderColor,_splashController.isWomen.value?AppColors.bgColor:AppColors.greyColor,() async {
                                _splashController.isWomen.value=true;
                                _splashController.isFirstTime.value = true;
                                Get.offNamed(Routes.navBarScreen);
                                await   PrefsHelper.setBool(AppConstant.isFirstTime, _splashController.isFirstTime.value);

                              },"Women"),
                            ],
                          ),
                        ),
                        SizedBox(height:10.h,),
                        TextButton(onPressed: () async {
                          _splashController.isFirstTime.value = true;
                          Get.offNamed(Routes.navBarScreen);
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool(AppConstant.isFirstTime, _splashController.isFirstTime.value);

                          // Retrieve the boolean value from SharedPreferences
                          bool? isFirstTime = prefs.getBool(AppConstant.isFirstTime);

                          print(isFirstTime);
                        }, child:Text(AppText.skip,style: CustomTextStyle.h3(color:AppColors.darkButtonColor),))
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

   _button(Color color,textColor,Function() onTab,String text) {
    return SizedBox(
                          height: 60.h,
                          width: 152.w,
                          child: ElevatedButton(onPressed:onTab,
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: color,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)
                                )
                              ),
                              child: Text(text,style:CustomTextStyle.h3(fontWeight: FontWeight.w500,color: textColor),)),
                        );
  }
}
