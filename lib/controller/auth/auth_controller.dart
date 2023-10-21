import 'dart:convert';

import 'package:ecommerce_app/api/api_checker.dart';
import 'package:ecommerce_app/api/api_client.dart';
import 'package:ecommerce_app/api/api_const.dart';
import 'package:ecommerce_app/helper/routes.dart';
import 'package:ecommerce_app/helper/share_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController{


  // Login

  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();



  // sign up
    var isVisibility=false.obs;
    var isRememberMe=false.obs;

  final nameRegController = TextEditingController().obs;
  final emailRegController = TextEditingController().obs;
  final passRegController = TextEditingController().obs;
  final confirmPassRegController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;


    var isLoading =false.obs;




    login()async{


      Map<String, dynamic> data =
      {
        'email': emailController.value.text,
        'password': passController.value.text
      };
        isLoading(true);
      Response response = await ApiClient.postData(ApiConstant.loginApi, json.encode(data),
          headers: {'Content-Type': 'application/json'});

        if(response.statusCode==200){

          debugPrint("--------------------check-------------------");
          debugPrint(data["token"].toString());
          var token = response.body['token'];
          debugPrint("token = $token");

          debugPrint("--------------------check-------------------");

          await   PrefsHelper.setString(AppConstant.token, token);


          Get.snackbar("Login Successful","Congratulation",backgroundColor: Colors.indigo[400],colorText: Colors.white);
            Get.offAllNamed(Routes.navBarScreen);
        }else{
            ApiChecker.checkApi(response);
        }
        isLoading(false);

    }

  registration()async{

    Map<String, dynamic> data = {

      "name": nameRegController.value.text,
      "email": emailRegController.value.text,
      "password": passRegController.value.text,
      "password_confirmation": confirmPassRegController.value.text,
      "phone": phoneController.value.text

    };


    isLoading(true);
    Response response = await ApiClient.postData(ApiConstant.registerApi, json.encode(data),
        headers: {'Content-Type': 'application/json'});

    print(response.statusCode);

    if(response.statusCode==200){
      print(response.body);



      Get.snackbar("Registration Successful","Congratulation",backgroundColor: Colors.indigo[400],colorText: Colors.white);

    }else{
      ApiChecker.checkApi(response);
    }
    isLoading(false);

  }

  logout()async{

      Get.offAllNamed(Routes.signInScreen);
      clearSharedData();

    }

  clearSharedData()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.clear();

  }




}








