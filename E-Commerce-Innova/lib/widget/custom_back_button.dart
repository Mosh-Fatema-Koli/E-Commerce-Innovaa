
import 'package:ecommerce_app/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/icons.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key, this.onTap, this.icon,this.color
  });
  final Function()? onTap;
  final Widget? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap?? (){
        Get.back();
      },
      child:
         Container(
          height: 45.h,
          width: 45.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:color?? Theme.of(context).secondaryHeaderColor
          ),
          child:icon??Image.asset(AppIcons.arrowLeft,height:25.h,width: 25.h,color:Theme.of(context).iconTheme.color,),


      ),
    );
  }
}