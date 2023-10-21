import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/controller/theme_controller.dart';
import 'package:ecommerce_app/helper/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_text.dart';
import '../../../utils/colors.dart';
import '../../../utils/style.dart';

class ChooseCategory extends StatelessWidget {
  ChooseCategory({
    super.key,
  });

  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppText.chooseCategory,
                style: CustomTextStyle.h3(
                    fontWeight: FontWeight.w500,
                  ),
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    // minimumSize: Size.zero
                  ),
                  child: Text(
                    AppText.viewAll,
                    style:
                    CustomTextStyle.h5(color: AppColors.greyColor),
                  ))
            ],
          ),
        ),


        SizedBox(
          height: 50.h,
          child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.categoryDetails);

                  },
                  child: Container(
                    height: double.infinity,
                    margin: EdgeInsets.only(left: index == 0 ? 20.w : 0),
                    padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 5.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color:Theme.of(context).secondaryHeaderColor),
                    child: Row(
                      children: [
                        Obx(()=>
                           Container(
                            height: 40.h,
                            width: 40.h,
                            padding: EdgeInsets.all(7.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color:Get.find<ThemeController>().isDarkTheme.value? const Color(0xFF29363D):AppColors.bgColor),
                            child: SvgPicture.asset(
                                _homeController.categoryList[index]["icon"],color:Theme.of(context).iconTheme.color,),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          _homeController.categoryList[index]["name"],
                          style: CustomTextStyle.h4(
                              fontWeight: FontWeight.w500,
                             ),
                        ),
                        SizedBox(
                          width: 5.h,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10.w,
                );
              },
              itemCount: _homeController.categoryList.length),
        )




      ],
    );
  }
}
