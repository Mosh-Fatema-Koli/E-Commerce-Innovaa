import 'dart:convert';

import 'package:ecommerce_app/api/api_const.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class SocialMediaController extends GetxController{

  var isLoading = false.obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signIn() async {

    isLoading(true);

    try {

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        Map<String, dynamic> body = {
          'email': userCredential.user!.email,

        };

        http.Response response= await http.post(Uri.parse(ApiConstant.loginApi) , body : body);

        print(response.body);
        var data= jsonDecode(response.body);
        print(data);

        print(response.statusCode);

        if(response.statusCode == 200){
          debugPrint("--------------------check-------------------");
          debugPrint(data["token"].toString());


          // var token = response.body['token'];
          // debugPrint("token = $token");
          //
          // debugPrint("--------------------check-------------------");
          //
          // await   PrefsHelper.setString(AppConstant.token, token);




        }
        else{

          Get.snackbar("Login Failed","",backgroundColor: Colors.white,colorText: Colors.black);

        }


      }
      isLoading(false);

    } catch (error) {
      debugPrint("Error during Google Sign-In: $error");
      isLoading(false);
    }


  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    // await GetStorage().read("token");
    // GetStorage().remove("token");
    //await  Get.offNamed(introScreen);
    // Navigator.pushReplacementNamed(Get.context!, Routes.splashScreen);
    //  await  di.init();
  }


  clearSharedData()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.clear();
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

}