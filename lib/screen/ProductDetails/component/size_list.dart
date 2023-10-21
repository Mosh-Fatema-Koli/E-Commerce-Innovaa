import 'package:ecommerce_app/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/style.dart';

class SizedList extends StatelessWidget {
   SizedList({
    super.key,
  });
  final  List size=[
      "S",
      "M",
      "L",
      "XL",
      "2XL"
    ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Size",
                style: CustomTextStyle.h3(
                    fontWeight: FontWeight.w600,
                   ),
              ),

                 Obx(()=>
                    Text(
                    "Size Guide",
                    style: CustomTextStyle.h4(color:Get.find<ThemeController>().isDarkTheme.value?AppColors.mainColor: AppColors.greyColor),
                ),
                 ),

            ],
          ),
        ),
        SizedBox(
          height: 11.h,
        ),
        Container(
          height: 60.h,
          alignment: Alignment.centerLeft,
          child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.w),

              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 60.h,
                  width: 60.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color:Theme.of(context).secondaryHeaderColor,
                  ),
                  child: Text(
                   size[index],
                    style: CustomTextStyle.h3(
                        fontWeight: FontWeight.w600,
                      ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 9.w,
                );
              },
              itemCount: size.length),
        ),
      ],
    );
  }
}