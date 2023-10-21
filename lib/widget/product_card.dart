

import 'package:ecommerce_app/helper/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/style.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(Routes.productDetails);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height:203.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color:Colors.transparent,
                    image: const DecorationImage(image:AssetImage("assets/image/shirt.png"),fit: BoxFit.fill,)
                ),
                // child: Image.asset("assets/image/shirt.png",fit:,),
              ),
              Positioned(
                  top:15.h ,
                  right: 15.w,
                  child: SvgPicture.asset(AppIcons.favoriteSvg)),
            ],
          ),
          SizedBox(height: 5.h,),
          Text("Trail Running Jacket Nike Windrunner",style: CustomTextStyle.h5(fontWeight: FontWeight.w500,height:1.4),maxLines:2,overflow: TextOverflow.ellipsis,),
          SizedBox(
            height:5.h,
          ),
          Text("\$99",style: CustomTextStyle.h4(fontWeight: FontWeight.w600,),)
        ],
      ),
    );
  }
}
