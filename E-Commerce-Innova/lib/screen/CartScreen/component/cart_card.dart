import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';
import '../../../utils/style.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color:Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              spreadRadius: -15,
              blurRadius: 100,
              offset: const Offset(0, 40),
              color: const Color(0xFF393F4A).withOpacity(0.25),
            )
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              "assets/image/shirt.png",
              height: 100.h,
              width: 100.h,
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "\$45 (-\$4.00 Tax)",
                    style: CustomTextStyle.h6(
                        color: AppColors.greyColor),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      strokeButton(AppIcons.arrowDown,(){}),
                      SizedBox(width:15.w,),
                      Text("1",style:CustomTextStyle.h5(fontWeight:FontWeight.w600,),),
                      SizedBox(width:15.w,),

                      strokeButton(AppIcons.arrowUp,(){}),
                      const Spacer(),
                      strokeButton(AppIcons.delete,(){}),

                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
  strokeButton(String icon,Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 25.h,
          width: 25.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape:BoxShape.circle,
              border: Border.all(
                  color: AppColors.strokeColor,
                  width: 1
              )

          ),
          child:SvgPicture.asset(icon,height:15.h,width: 15.h,fit: BoxFit.fill,)


      ),
    );
  }

}
