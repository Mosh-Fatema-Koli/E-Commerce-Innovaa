import 'package:ecommerce_app/controller/splash_controller.dart';
import 'package:ecommerce_app/controller/theme_controller.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  final _splashController=Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    _splashController.jumpPage();
    return Obx(()=>
       Scaffold(
        backgroundColor:Get.find<ThemeController>().isDarkTheme.value?AppColors.darkBgColor :AppColors.mainColor,
        body: Center(
          child:Image.asset(AppIcons.appLogo,fit: BoxFit.fill,height: 37.h,width: 59.w,color:Get.find<ThemeController>().isDarkTheme.value?AppColors.mainColor:AppColors.bgColor,),
        ),

      ),
    );
  }
}
