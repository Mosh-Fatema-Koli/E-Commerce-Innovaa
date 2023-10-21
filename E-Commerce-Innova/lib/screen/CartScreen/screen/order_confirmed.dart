import 'package:ecommerce_app/controller/theme_controller.dart';
import 'package:ecommerce_app/utils/app_text.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/images.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:ecommerce_app/widget/custom_back_button.dart';
import 'package:ecommerce_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.only(left: 20.w),
          child: const CustomBackButton(),
        ),
        leadingWidth: 65.w,
      ),
      body: Column(
        children: [
          SizedBox(height: 106.h,),
          Stack(
            alignment:Alignment.bottomCenter,
            children: [
         //     Image.asset(AppImage.mask,height: 336.h,width: double.infinity,fit: BoxFit.cover,),
              Positioned(child:Image.asset(AppImage.orderConfirmed,height: 232.h,))
            ],
          ),
          SizedBox(height:40.h,),
          Text(AppText.orderConfirmed,style: CustomTextStyle.customSize(size: 28.sp,fontWeight: FontWeight.w600,),)
        ,
          SizedBox(height:10.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:20.w),
            child: Text(AppText.confirmedDes,style: CustomTextStyle.h4(color:AppColors.greyColor),textAlign: TextAlign.center,),
          ),
          SizedBox(height: 106.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            width: double.infinity,
            height:50.h ,
            child: ElevatedButton(onPressed:(){

            },
                style: ElevatedButton.styleFrom(
                  backgroundColor:Get.find<ThemeController>().isDarkTheme.value?AppColors.darkButtonColor:const Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)
                  ),
                  elevation: 0
                )
                , child: Text(AppText.goToOrders,style: CustomTextStyle.h3(fontWeight: FontWeight.w500,color:AppColors.greyColor),)),
          ),
          SizedBox(height: 30.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(text: AppText.continueShopping, onTap: (){}),
          )




        ],
      )
      ,
    );
  }
}
