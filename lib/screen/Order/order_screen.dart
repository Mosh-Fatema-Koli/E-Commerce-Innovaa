import 'package:ecommerce_app/controller/theme_controller.dart';
import 'package:ecommerce_app/helper/routes.dart';
import 'package:ecommerce_app/utils/app_text.dart';
import 'package:ecommerce_app/widget/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/nav_bar_controller.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/style.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          leadingWidth: 65.w,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: CustomBackButton(
              onTap: () {
                // Scaffold.of(context).openDrawer();
                Get.find<NavBarController>().scaffoldKey.currentState!.openDrawer();

              },
              icon: SvgPicture.asset(AppIcons.menuSvg, height: 25.h, width: 25.h,color:Theme.of(context).iconTheme.color,),
            ),
          ),
          centerTitle: true,
          title: Text(AppText.order),
          actions: [
            CustomBackButton(
              onTap: () {
                Get.toNamed(Routes.cartScreen);
              },
              icon: SvgPicture.asset(
                AppIcons.bagSvg,
                height: 25.h,
                width: 25.h,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            SizedBox(
              width: 20.w,
            )
          ],
        ),
        
      
      body:ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Get.toNamed(Routes.orderDetails);
              },
              child: Container(

                width: double.infinity,
                padding: EdgeInsets.all(10.h,),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color:Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius:0,
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                        color: const Color(0xFF000000).withOpacity(0.15),
                      )]


                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            "assets/image/shirt.png",
                            height: 70.h,
                            width: 70.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: 15.w,),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  "Men's Tie-Dye T-Shirt Nike Sportswear",
                                  style: CustomTextStyle.h4(
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 10.h,),

                                Text(
                                  "02-10-2023",
                                  style: CustomTextStyle.h6(
                                      color: AppColors.greyColor),
                                ),


                              ],
                            )),
                      ],
                    ),
                    SizedBox(height:10.h,),
                    Row(
                      children: [
                     Expanded(child:  Text("Price (12 items)",style: CustomTextStyle.h4(color:AppColors.greyColor),maxLines:1,overflow: TextOverflow.ellipsis,),),
                        Text("\$5000",style:CustomTextStyle.h4(fontWeight:FontWeight.w600,),),
                      ],
                    ),

                    const Divider(),
                    Row(
                      children: [
                        Expanded(child:  Text(AppText.status,style: CustomTextStyle.h4(color:AppColors.greyColor),maxLines:1,overflow: TextOverflow.ellipsis,)),
                        Text("Pending",style:CustomTextStyle.h4(fontWeight:FontWeight.w600,),),
                      ],
                    ),
                    SizedBox(height:10.h),
                    Row(
                      children: [
                        SizedBox(
                          height: 35.h,
                        //  width: double.infinity,
                          child: Obx(()=>
                             ElevatedButton(onPressed:(){
                               Get.toNamed(Routes.orderDetails);

                            },

                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor:Get.find<ThemeController>().isDarkTheme.value?AppColors.darkBgColor: const Color(0xFFF5F5F5),
                                ),
                                child: Text(AppText.view,style: CustomTextStyle.h4(fontWeight: FontWeight.w600,color:Theme.of(context).iconTheme.color),)),
                          ),
                        ),
                        Spacer(),


                        SizedBox(
                          height: 35.h,
                       //   width: double.infinity,
                          child: ElevatedButton(onPressed:(){

                          },

                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainColor,
                              ),
                              child: Text(AppText.reOrder,style: CustomTextStyle.h4(fontWeight: FontWeight.w600),)),
                        ),


                      ],
                    ),






                  ],
                ),
              ),
            );



      }, separatorBuilder: (context,index){
            return SizedBox(height:10.h,);
      }, itemCount:10

      )
    );
  }
}
