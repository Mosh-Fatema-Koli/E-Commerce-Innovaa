import 'package:ecommerce_app/widget/custom_button.dart';
import 'package:ecommerce_app/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_text.dart';
import '../../../utils/colors.dart';
import '../../../utils/style.dart';
import '../../../widget/custom_back_button.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            //<--------------- name ---------------->
            Text(
              AppText.name,
              style: CustomTextStyle.h3(
                  fontWeight: FontWeight.w500,
                 ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextField(
              hintText: "Mrh Raju",
            ),
            SizedBox(
              height: 15.h,
            ),

            //<--------------- Country And city ---------------->
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.country,
                        style: CustomTextStyle.h3(
                            fontWeight: FontWeight.w500,
                         ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const CustomTextField(
                        hintText: "Bangladesh",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.city,
                        style: CustomTextStyle.h3(
                            fontWeight: FontWeight.w500,
                       ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const CustomTextField(
                        hintText: "Sylhet",
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            //<---------------Phone Number ---------------->
            Text(
              AppText.phoneNumber,
              style: CustomTextStyle.h3(
                  fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextField(
              hintText: "+880 1796556552",
            ),
            SizedBox(
              height: 15.h,
            ),
            //<--------------- Address ---------------->
            Text(
              AppText.address,
              style: CustomTextStyle.h3(
                  fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextField(
              hintText: "Chhatak, Sunamgonj",
            ),
            SizedBox(
              height: 15.h,
            ),
            //<--------------- Save as primary address ---------------->
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppText.saveAsPrimaryAddress,
                  style: CustomTextStyle.h4(fontWeight: FontWeight.w500,),
                ),
                SizedBox(
                  height: 25.h,
                  width: 38.w,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: CupertinoSwitch(
                      value: true,
                      activeColor: AppColors.switchColor,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            //<--------------- Save and address ---------------->
            CustomButton(text: AppText.saveAddress, onTap: (){

            })

          ],
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: Text(
        AppText.address,
        style: CustomTextStyle.h3(),
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
