import 'package:ecommerce_app/controller/nav_bar_controller.dart';
import 'package:ecommerce_app/controller/theme_controller.dart';
import 'package:ecommerce_app/utils/app_text.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/icons.dart';
import 'package:ecommerce_app/utils/images.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:ecommerce_app/widget/custom_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../helper/routes.dart';

class CustomDrawer extends StatelessWidget {
   CustomDrawer({super.key});
 final  ThemeController _themeController =Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {


    return Drawer(
      child:SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal:20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profileCard(),
            SizedBox(
              height: 30.h,
            ),
            _customListTile(
              ontap: (){

                _themeController.setDarkTheme(!_themeController.isDarkTheme.value);
              },
              icon:AppIcons.sun,title:AppText.darkMode,trailing:  SizedBox(
              height: 25.h,
              width: 38.w,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Obx(()=>
                   CupertinoSwitch(
                    value:_themeController.isDarkTheme.value,
                    activeColor: AppColors.switchColor,
                    onChanged: (value) {
                    _themeController.setDarkTheme(value);


                    },
                  ),
                ),
              ),
            ),),
            _customListTile(icon:AppIcons.infoCircle,title:AppText.accountInformation,ontap:(){} ),
            _customListTile(icon:AppIcons.lock,title:AppText.password,ontap:(){} ),
            _customListTile(icon:AppIcons.bagSvg,title:AppText.order,ontap:(){} ),
            _customListTile(icon:AppIcons.walletSvg,title:AppText.myCards,ontap:(){} ),
            _customListTile(icon:AppIcons.favoriteSvg,title:AppText.wishlist,ontap:(){} ),
            _customListTile(icon:AppIcons.setting,title:AppText.settings,ontap:(){} ),
            SizedBox(height: 147.h,),

            ListTile(
              onTap: (){
                Get.offAllNamed(Routes.signInScreen);
                
              },
              dense: true,
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 10.w,
              visualDensity: const VisualDensity(
                  vertical: -2
              ),
              leading: SvgPicture.asset(AppIcons.logout,height: 25.h,width: 25.h,fit: BoxFit.fill, ),
              title:Text(AppText.logout,style: CustomTextStyle.h4(color:const Color(0xFFFF5757)),),
              )







          ],
        ),
      ),
    );
  }

   _customListTile({required String icon,required String title,Widget? trailing,Function()? ontap,}) {
    return
      Obx(()=>  ListTile(
        onTap: ontap,
              dense: true,
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 10.w,
              visualDensity: const VisualDensity(
                vertical: -2
              ),
              leading: SvgPicture.asset(icon,height: 25.h,width: 25.h,fit: BoxFit.fill,color:(_themeController.isDarkTheme.value?AppColors.darkHeaderTextColor:AppColors.headerTextColor) ),
              title:Text(title,style: CustomTextStyle.h4(color:(_themeController.isDarkTheme.value? AppColors.darkHeaderTextColor:AppColors.headerTextColor)),),
              trailing:trailing,)

    );
  }

   _profileCard() {
    return Obx(()=>
       Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 45.h,),
                CustomBackButton(
                  icon:SvgPicture.asset(AppIcons.menuDown,color:_themeController.isDarkTheme.value?AppColors.darkHeaderTextColor:AppColors.headerTextColor,),
                  onTap: (){
                    Get.find<NavBarController>().scaffoldKey.currentState!.closeDrawer();

                  },

                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 45.h,
                      width: 45.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.greyColor,
                        image: DecorationImage(image:AssetImage(AppImage.profileImage,),fit: BoxFit.fill)
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mrh Raju",maxLines: 1,overflow: TextOverflow.ellipsis,style: CustomTextStyle.h3(fontWeight: FontWeight.w500,),)
                      ,
                        SizedBox(height: 5.h,),
                        Row(
                          children: [
                            FittedBox(child: Text("Verified Profile",style:CustomTextStyle.h5(color: AppColors.greyColor),maxLines:1,overflow:TextOverflow.ellipsis,)),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(AppIcons.star,height: 10.w,width: 10.w,fit: BoxFit.fill,),
                                Icon(Icons.check,color:AppColors.bgColor,size: 5.w,)
                              ],
                            )

                          ],
                        )

                      ],
                    )),
                    SizedBox(
                      height: 32.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:_themeController.isDarkTheme.value?AppColors.darkButtonColor: const Color(0xFFF5F5F5),
                          ),
                          onPressed:(){}, child:Text("3 Orders",style: CustomTextStyle.h6(fontWeight: FontWeight.w500,color: AppColors.greyColor,),)),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
