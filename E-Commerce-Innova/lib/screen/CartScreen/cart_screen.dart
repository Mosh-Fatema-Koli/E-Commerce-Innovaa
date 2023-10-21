import 'package:ecommerce_app/helper/routes.dart';
import 'package:ecommerce_app/screen/CartScreen/component/cart_card.dart';
import 'package:ecommerce_app/utils/images.dart';
import 'package:ecommerce_app/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/app_text.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/style.dart';
import '../../widget/custom_back_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CartCard();
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                  itemCount: 2),
               _deliveryAddress(context),
              _paymentMethod(context),
              SizedBox(height:20.h,),
              Text(AppText.orderInfo,style: CustomTextStyle.h3(fontWeight: FontWeight.w500,),)
             ,
              _orderListTile(AppText.subTotal,110),
              _orderListTile(AppText.shippingCost,10),
              _orderListTile(AppText.total,120),
              SizedBox(height: 15.h,),
              CustomButton(text:AppText.checkout, onTap: (){
                Get.toNamed(Routes.orderConfirmedScreen);
              }),
              SizedBox(height:25.h,),

              
              
              
              
            ],
          ),
        ));
  }

   _orderListTile(String title,int amount) {
    return ListTile(
              dense: true,
              minLeadingWidth: 0,
              minVerticalPadding: 0,
              visualDensity: const VisualDensity(horizontal: 4,vertical: -4),
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.zero,
              title: Text(title,style: CustomTextStyle.h4(color: AppColors.greyColor),),
              trailing: Text("\$$amount",style: CustomTextStyle.h4(fontWeight: FontWeight.w500,),),

            );
  }

   _deliveryAddress(BuildContext context) {
    return Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 ListTile(
                   dense: true,
                  minLeadingWidth: 0,
                  minVerticalPadding: 0,
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.zero,
                  onTap: (){
                     Get.toNamed(Routes.addressScreen);

                  },
                  title:  Text(AppText.deliveryAddress,style: CustomTextStyle.h3(fontWeight: FontWeight.w500,),),
                   trailing:Icon(Icons.arrow_forward_ios,size:15.h,color: Theme.of(context).iconTheme.color,),
                 ),
            Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(AppIcons.map,fit: BoxFit.fill,height:50.h,width: 50.h,),
                        ),
                        CircleAvatar(
                          radius:10.r,
                          backgroundColor: AppColors.errorColor,
                          child:SvgPicture.asset(AppIcons.locationSvg,height:14.r,width: 14.r,fit: BoxFit.fill,),
                        )
                      ],
                    ),
                    SizedBox(width: 15.w,),
                    Expanded(child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Chhatak, Sunamgonj 12/8AB",style:CustomTextStyle.h4(),maxLines: 1,overflow: TextOverflow.ellipsis,),
                       SizedBox(height: 10.h,),
                        Text("Sylhet",style:CustomTextStyle.h5(color: AppColors.greyColor),)
                      ],
                    )),
                    CircleAvatar(
                      radius:12.r,
                      backgroundColor: AppColors.switchColor,
                      child:Icon(Icons.check,color:AppColors.bgColor,size:15.r ,),
                    )



                  ],
            ),
               ],
             );
  }

  _paymentMethod(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          dense: true,
          minLeadingWidth: 0,
          minVerticalPadding: 0,
          horizontalTitleGap: 0,
          contentPadding: EdgeInsets.zero,
          onTap: (){

          },
          title:  Text(AppText.paymentMethod,style: CustomTextStyle.h3(fontWeight: FontWeight.w500,),),
          trailing:Icon(Icons.arrow_forward_ios,size:15.h,color: Theme.of(context).iconTheme.color,),
        ),
        Row(
          children: [
           Container(
             height: 50.h,
             width: 50.h,
             alignment: Alignment.center,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10.r),
               color:AppColors.greyButtonColor,
             ),
             child: SvgPicture.asset(AppIcons.visaSvg,height:30.h,width: 30.h,fit: BoxFit.fill ,),
           ),
            SizedBox(width: 15.w,),
            Expanded(child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Visa Classic",style:CustomTextStyle.h4(),maxLines: 1,overflow: TextOverflow.ellipsis,),
                SizedBox(height: 10.h,),
                Text("**** 7690",style:CustomTextStyle.h5(color: AppColors.greyColor),)
              ],
            )),
            CircleAvatar(
              radius:12.r,
              backgroundColor: AppColors.switchColor,
              child:Icon(Icons.check,color:AppColors.bgColor,size:15.r ,),
            )



          ],
        ),
      ],
    );
  }


  _appBar() {
    return AppBar(
      title: Text(
        AppText.cart,

      ),
      centerTitle: true,
      leadingWidth: 65.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: const CustomBackButton(),
      ),
    );
  }
}
