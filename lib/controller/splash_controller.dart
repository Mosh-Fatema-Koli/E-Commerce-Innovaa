import 'dart:ffi';

import 'package:ecommerce_app/helper/routes.dart';
import 'package:ecommerce_app/helper/share_pref_helper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController{


      var isWomen=true.obs;
      RxBool isFirstTime = false.obs;

  
  jumpPage() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retrieve the boolean value from SharedPreferences
    bool? isFirstTime = prefs.getBool(AppConstant.isFirstTime);
    print(isFirstTime);

    Future.delayed(const Duration(seconds: 3),(){
      if(isFirstTime == true){
        Get.offNamed(Routes.onBoard);
      }else{
        Get.offAllNamed(Routes.navBarScreen);
      }
      
      
    });
  }
  
  
  
}