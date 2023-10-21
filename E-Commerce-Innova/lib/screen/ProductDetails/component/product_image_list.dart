
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class ProductImageList extends StatelessWidget {
  const ProductImageList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77.h,
      alignment: Alignment.centerLeft,
      child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(

              height:77.h,
              width: 77.w,
              margin: EdgeInsets.only(left: index == 0 ? 20.w : 0,),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.greyButtonColor,
                image:const DecorationImage(image: AssetImage("assets/image/shirt.png"),fit: BoxFit.fill),


              ),


            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10.w,
            );
          },
          itemCount:4),
    );
  }
}