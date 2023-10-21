import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import '../utils/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,required this.onTap
  });
  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      borderRadius: BorderRadius.circular(25.r),
      child: Container(
        height: 50.h,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          // color:AppColors.mainColor ,
            borderRadius: BorderRadius.circular(25.r),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:[
                  AppColors.mainColor.withOpacity(0.6) ,
                  AppColors.mainColor ,

                ])
        ),
        child: Text(text,style: CustomTextStyle.h3(fontWeight:FontWeight.w700,color: AppColors.bgColor),),
      ),
    );
  }
}