


import 'package:ecommerce_app/controller/auth/auth_controller.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/controller/splash_controller.dart';
import 'package:ecommerce_app/controller/verification_controller.dart';
import 'package:get/get.dart';

Future init() async {
  Get.lazyPut(() =>SplashController() );
  Get.lazyPut(() =>AuthController() );
  Get.lazyPut(() =>VerificationController() );
  Get.lazyPut(() =>HomeController() );



}