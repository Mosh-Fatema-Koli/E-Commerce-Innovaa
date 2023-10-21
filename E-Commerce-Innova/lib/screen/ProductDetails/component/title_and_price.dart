import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/style.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Men's Printed Pullover Hoodie",style:CustomTextStyle.h5(color: AppColors.greyColor) ,),
              SizedBox(height: 8.h,),
              Text("Nike Club Fleece",style: CustomTextStyle.h2(fontWeight: FontWeight.w600,),),


            ],
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Price",style:CustomTextStyle.h5(color: AppColors.greyColor) ,),
              SizedBox(height: 8.h,),
              Text("\$120",style: CustomTextStyle.h2(fontWeight: FontWeight.w600,),),

            ],
          )

        ],
      ),
    );
  }
}
