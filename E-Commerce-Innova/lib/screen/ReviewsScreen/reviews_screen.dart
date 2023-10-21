import 'package:ecommerce_app/controller/theme_controller.dart';
import 'package:ecommerce_app/helper/routes.dart';
import 'package:ecommerce_app/utils/app_text.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/icons.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:ecommerce_app/widget/custom_back_button.dart';
import 'package:ecommerce_app/widget/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(AppText.reviews,),
        centerTitle: true,
        leadingWidth: 65.w,
        leading: Padding(
          padding:  EdgeInsets.only(left: 20.w),
          child: const CustomBackButton(),
        ),
        
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child:Column(
          children: [

            addReview(),
            SizedBox(height:30.h,),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){

              return const ReviewsCard();
            }, separatorBuilder: (context,index){
              return SizedBox(height:20.h ,);
            }, itemCount: 10)

            
            
            
            
            
            
            
          ],
        ),
      ),
    );
  }

   addReview() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(
              children: [
                Text("250 ${AppText.reviews}",style: CustomTextStyle.h4(fontWeight: FontWeight.w500,),),
               SizedBox(height: 6.h,),
                Row(

                  children: [
                    Text("4.8",style: CustomTextStyle.h5(),),
                    RatingBar.builder(
                      initialRating: 3,

                      minRating: 1,
                      ignoreGestures: true,
                      unratedColor: AppColors.greyColor,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemSize:12.sp,
                      itemPadding: EdgeInsets.symmetric(horizontal:0.3.w),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )
                  ],
                )
              ],
            ),
              SizedBox(
                height:35.h,
                child: Obx(()=>
                   ElevatedButton(onPressed: (){
                    Get.toNamed(Routes.addReview);
                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Get.find<ThemeController>().isDarkTheme.value? AppColors.mainColor:Color(0xFFFF7043)
                      )
                      , child:Row(
                        children: [
                          Image.asset(AppIcons.editSquare,height:15.h,width: 15.h,fit: BoxFit.fill,),
                        SizedBox(width: 5.w,),

                          Text("Add Review",style:CustomTextStyle.h5(fontWeight: FontWeight.w500),),
                        ],
                      )),
                ),
              )

            ],
          );
  }
}
