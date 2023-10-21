import 'package:ecommerce_app/utils/app_text.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:ecommerce_app/widget/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// <------------------ Order Details ----------------->

            Text(
              "Details",
              style: CustomTextStyle.h3(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: _buildBoxDecoration(context),
              child: Column(
                children: [
                  _listTile(AppText.orderCreated, "Sun,May 7,2021"),
                  const Divider(),
                  _listTile(AppText.orderTime, "06:18 PM"),
                  const Divider(),
                  _listTile(AppText.items, "5"),
                  const Divider(),
                  _listTile(AppText.orderId, "#5225222522"),
                ],
              ),
            ),

            /// <------------------ Order Status ----------------->
            SizedBox(
              height: 10.h,
            ),
            Text(
              AppText.orderStatus,
              style: CustomTextStyle.h3(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: _buildBoxDecoration(context),
              child: _listTile(AppText.orderStatus, "Pending"),
            ),

            /// <------------------ Full - Filled  ----------------->
            SizedBox(
              height: 10.h,
            ),
            Text(
             "${ AppText.fullFilled} (5)",
              style: CustomTextStyle.h3(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView.separated(
                itemCount:5,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:(context,index)
                {
              return Container(
                decoration: _buildBoxDecoration(context),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        "assets/image/shirt.png",
                        height: 80.w,
                        width: 80.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 15.w,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text("Online shopping from a great selection at Books Store",style: CustomTextStyle.h3(fontWeight:FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 5.w,),
                        Text("\$25000",style: CustomTextStyle.h4(fontWeight:FontWeight.w600,color:AppColors.mainColor),),
                        SizedBox(height: 5.w,),
                        Text("Qty: 5",style: CustomTextStyle.h5(color:AppColors.greyColor),),

                        
                      ],
                    ))
                    
                    
                    
                  ],
                ),
                
                
              );
            }, separatorBuilder:(context,index){
              return SizedBox(height: 10.h,);
            },),
          ],
        ),
      ),
    );
  }

  _buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 24,
            offset: const Offset(0, 8),
            color: const Color(0xFF000000).withOpacity(0.15),
          )
        ]);
  }

  _listTile(String title, des) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          title,
          style: CustomTextStyle.h4(color: AppColors.greyColor),
        )),
        Text(
          des,
          style: CustomTextStyle.h3(fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  _appBar() {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: const CustomBackButton(),
      ),
      leadingWidth: 65.w,
      centerTitle: true,
      title: Text(AppText.orderDetails),
    );
  }
}
