import 'package:ecommerce_app/helper/routes.dart';
import 'package:ecommerce_app/screen/ProductDetails/component/size_list.dart';
import 'package:ecommerce_app/screen/ProductDetails/component/title_and_price.dart';
import 'package:ecommerce_app/screen/ReviewsScreen/reviews_screen.dart';
import 'package:ecommerce_app/utils/app_text.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/icons.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:ecommerce_app/widget/custom_back_button.dart';
import 'package:ecommerce_app/widget/custom_button.dart';
import 'package:ecommerce_app/widget/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../controller/theme_controller.dart';
import 'component/product_image_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
              //  physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 380.h,
                          child: Image.asset(
                            "assets/image/shirt.png",
                            fit: BoxFit.fill,
                            height: double.maxFinite,
                            width: double.maxFinite,
                          ),
                        ),
                        Positioned(
                            top: 15.h,
                            right: 20.w,
                            left: 20.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 CustomBackButton(color:AppColors.bgColor,icon:Image.asset(AppIcons.arrowLeft,fit: BoxFit.fill,height: 25.h,width: 25.h,),),
                                CustomBackButton(
                                  color: AppColors.bgColor,
                                  icon: SvgPicture.asset(
                                    AppIcons.bagSvg,
                                    height: 25.h,
                                    width: 25.h,
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    //<------------- Price and Title -------------->
                    TitleAndPrice(),
                    SizedBox(height: 15.h,),
                    //<------------- Image List -------------->
                    ProductImageList(),
                    SizedBox(height: 15.h,),
                    SizedList(),
                    SizedBox(height: 20.h,),

                    //<------------- Description -------------->
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        AppText.description,
                        style: CustomTextStyle.h3(
                            fontWeight: FontWeight.w600,
                          ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.w),
                      child: ReadMoreText(
                        'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with . Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                        trimLines:3,
                        style: CustomTextStyle.h4(color: AppColors.greyColor,height: 1.4),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Read more',
                        trimExpandedText: 'Read less',
                        moreStyle: CustomTextStyle.h4(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).iconTheme.color
                           ),
                        lessStyle: CustomTextStyle.h4(
                            fontWeight: FontWeight.w600,
                          color: Theme.of(context).iconTheme.color
                           ),
                      ),
                    ),
                    //<------------- Review -------------->
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppText.reviews ,
                            style: CustomTextStyle.h3(
                                fontWeight: FontWeight.w600,
                               ),
                          ),
                          TextButton(
                              onPressed: () {
                               Get.toNamed(Routes.reviewScreen);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                // minimumSize: Size.zero
                              ),
                              child: Obx(()=>
                                 Text(
                                  AppText.viewAll,
                                  style:
                                  CustomTextStyle.h5(color: Get.find<ThemeController>().isDarkTheme.value?AppColors.mainColor: AppColors.greyColor),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Padding(

                        padding: EdgeInsets.symmetric(horizontal:20.w),
                        child: const ReviewsCard()),



                    SizedBox(height: 25.h,)





                  ],
                ),
              ),
            ),

            /// <-------------- Total Cost -------------->
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius:10,
                    spreadRadius:0,
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0, 3)
                  )
                ]
              ),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    minVerticalPadding: 0,
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                    minLeadingWidth: 0,
                    trailing: Text("\$120",style: CustomTextStyle.h2(fontWeight: FontWeight.w700,),),
                    title: Text(AppText.totalPrice,style: CustomTextStyle.h3(fontWeight: FontWeight.w600,),),
                    subtitle: Text(AppText.withVATSD,style: CustomTextStyle.h6(color: AppColors.greyColor),),

                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomButton(text: AppText.addToCart, onTap: (){

                    }),
                  ),
                  SizedBox(height: 10.h,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
