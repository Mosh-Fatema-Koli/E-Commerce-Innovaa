import 'package:ecommerce_app/controller/nav_bar_controller.dart';
import 'package:ecommerce_app/controller/theme_controller.dart';
import 'package:ecommerce_app/utils/app_text.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/icons.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widget/drawer.dart';

class NavBarScreen extends StatelessWidget {
   NavBarScreen({super.key});
  final _navController =Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _navController.scaffoldKey,
      drawer: CustomDrawer(),
      body:Obx(() => _navController.page[_navController.isSelectIndex.value]),
      bottomNavigationBar:Obx(()=>
         BottomNavigationBar(
            currentIndex: _navController.isSelectIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            fixedColor: AppColors.bgColor,
            backgroundColor: Get.find<ThemeController>().isDarkTheme.value?const Color(0xFF29363D): AppColors.bgColor,
            onTap:(index){
              _navController.changePosition(index);
            },
            items:[
          bottomBarItem(label:AppText.home, isSelect:_navController.isSelectIndex.value==0,icon:AppIcons.homeSvg),
          bottomBarItem(label:AppText.wishList, isSelect:_navController.isSelectIndex.value==1,icon:AppIcons.favoriteSvg),
          bottomBarItem(label:AppText.order, isSelect:_navController.isSelectIndex.value==2,icon:AppIcons.cartSvg),
          bottomBarItem(label:AppText.profile, isSelect:_navController.isSelectIndex.value==3,icon:AppIcons.walletSvg),


        ]),
      ),
    );
  }

   bottomBarItem({required String label, icon,required bool isSelect}) {
    return BottomNavigationBarItem(icon:isSelect? Text(label,style: CustomTextStyle.h5(fontWeight: FontWeight.w500,color:AppColors.mainColor),):SvgPicture.asset(icon),
      label: ""
      );
  }
}
