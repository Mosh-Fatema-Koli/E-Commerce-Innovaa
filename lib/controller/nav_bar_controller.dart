import 'package:ecommerce_app/screen/CartScreen/cart_screen.dart';
import 'package:ecommerce_app/screen/HomeScreen/home_screen.dart';
import 'package:ecommerce_app/screen/profile/peofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/Order/order_screen.dart';
import '../screen/WishList/wish_list.dart';

class NavBarController extends GetxController{

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    var isSelectIndex=0.obs;

    changePosition(int index){
      isSelectIndex.value=index;
    }

    List<Widget> page=[
      HomeScreen(),
      WishListScreen(),
      OrderScreen(),
      ProfilePage()


    ];






}