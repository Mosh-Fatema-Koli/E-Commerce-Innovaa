import 'package:ecommerce_app/helper/routes.dart';
import 'package:ecommerce_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/app_text.dart';
import '../../utils/colors.dart';
import '../../utils/style.dart';
import '../../widget/custom_back_button.dart';
import '../../widget/product_card.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "365 items",
                style: CustomTextStyle.h3(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "Available in stock",
                style: CustomTextStyle.h4(color: AppColors.greyColor),
              ),
              trailing: Container(
                alignment: Alignment.center,
                width:70.w ,
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color:Theme.of(context).secondaryHeaderColor
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.sort,color:Theme.of(context).iconTheme.color,height: 15.sp,width: 15.sp,),
                    SizedBox(width: 5.w,),
                    Text(
                      "Sort",
                      style: CustomTextStyle.h4(
                        fontWeight: FontWeight.w500,

                      ),
                    ),
                  ],
                ),



              ),



            ),

            MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15.h,
              crossAxisSpacing: 15.w,
              padding: EdgeInsets.symmetric(horizontal:20.w),
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const ProductCard();
              },
            )

          ],
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      title: Container(
        alignment: Alignment.center,
        width:68.w ,
        height: 45.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color:Theme.of(context).secondaryHeaderColor
        ),
        child:   SvgPicture.asset("assets/image/Vector.svg",color:Theme.of(context).iconTheme.color,),




      ),
      centerTitle: true,
      leadingWidth: 65.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child:   CustomBackButton(onTap:(){
          Get.back();
        },),
      ),
      actions: [
        CustomBackButton(
          icon: SvgPicture.asset(
            AppIcons.bagSvg,
            height: 25.h,
            width: 25.h,
            color: Theme.of(context).iconTheme.color,
          ),
          onTap: () {
            Get.toNamed(Routes.cartScreen);
          },
        ),
        SizedBox(
          width: 20.w,
        ),
      ],
    );
  }
}
