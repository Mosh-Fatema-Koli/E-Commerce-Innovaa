import 'package:ecommerce_app/screen/CartScreen/cart_screen.dart';
import 'package:ecommerce_app/screen/CartScreen/screen/address.dart';
import 'package:ecommerce_app/screen/CartScreen/screen/order_confirmed.dart';
import 'package:ecommerce_app/screen/Forgot/forgot_password.dart';
import 'package:ecommerce_app/screen/Forgot/reset_password.dart';
import 'package:ecommerce_app/screen/Auth/sigin_in.dart';
import 'package:ecommerce_app/screen/Forgot/verification_code.dart';
import 'package:ecommerce_app/screen/LetsGetStarts/lets_get_starts.dart';
import 'package:ecommerce_app/screen/Onboard/onboard_screen.dart';
import 'package:ecommerce_app/screen/Order/screen/order_details_screen.dart';
import 'package:ecommerce_app/screen/ProductDetails/product_details_screen.dart';
import 'package:ecommerce_app/screen/ReviewsScreen/Screen/add_review_screen.dart';
import 'package:ecommerce_app/screen/ReviewsScreen/reviews_screen.dart';
import 'package:ecommerce_app/screen/SplashScreen/splash_screen.dart';
import 'package:get/get.dart';

import '../screen/Auth/sign_up_screen.dart';
import '../screen/CategoryDetailsScreen/category_details_screen.dart';
import '../screen/Navbar/navbar_screen.dart';

class Routes{
  static String splashScreen="/splash_screen";
  static String onBoard="/on_board";
  static String letsGetStarts='/lets_get_starts';
  static String signUpScreen="/sign_up_screen";
  static String signInScreen="/sign_in_screen";
  static String forgotPassword="/forgot_password";
  static String verificationScreen="/verification_screen";
  static String resetPassword="/reset_password";
  static String navBarScreen="/nav_bar_screen";
  static String productDetails="/product_details";
  static String reviewScreen="/review_screen";
  static String addReview="/add_review";
  static String cartScreen="/cart_screen";
  static String addressScreen="/address_screen";
  static String orderConfirmedScreen="/order_confirmed_screen";
  static String categoryDetails="/category_details";
  static String orderDetails="/order_details";



}

List<GetPage> pages=[
  GetPage(name: Routes.splashScreen, page:()=>  SplashScreen()),
  GetPage(name: Routes.onBoard, page:()=>  OnBoardScreen()),
  GetPage(name: Routes.letsGetStarts, page: ()=>const LetsGetStart()),
  GetPage(name: Routes.signUpScreen, page: ()=> SignUpScreen()),
  GetPage(name: Routes.signInScreen, page: ()=> SignInScreen() ),
  GetPage(name: Routes.forgotPassword, page: ()=> const ForgotPassword() ),
  GetPage(name: Routes.verificationScreen, page: ()=> VerificationCodeScreen() ),
  GetPage(name: Routes.resetPassword, page: ()=> ResetPassword() ),
  GetPage(name: Routes.navBarScreen, page: ()=> NavBarScreen() ),
  GetPage(name: Routes.productDetails, page: ()=> ProductDetailsScreen() ),
  GetPage(name: Routes.reviewScreen, page: ()=> ReviewsScreen() ),
  GetPage(name: Routes.addReview, page: ()=> AddReviewScreen() ),
  GetPage(name: Routes.cartScreen, page: ()=> CartScreen() ),
  GetPage(name: Routes.addressScreen, page: ()=> AddressScreen() ),
  GetPage(name: Routes.orderConfirmedScreen, page: ()=> OrderConfirmedScreen() ),
  GetPage(name: Routes.categoryDetails, page: ()=> CategoryDetails() ),
  GetPage(name: Routes.orderDetails, page: ()=> OrderDetailsScreen() ),





];