
import 'package:ecommerce_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_text.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/icons.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:Dimensions.PADDING_SIZE_DEFAULT.w),
      child: Row(
        children: [
           Expanded(
            child: CustomTextField(
              hintText:AppText.search,
              prefixIcon: SvgPicture.asset(AppIcons.searchSvg,height:10.h,width: 20.h,),
            ),
          ),
          SizedBox(width: 10.w,),
          Container(
            height: 50.h,
            width: 50.h,
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.mainColor,
            ),
            child:SvgPicture.asset(AppIcons.voiceSvg,fit: BoxFit.fill,height: 24.h,width: 24.h,),
          )

        ],
      ),
    );
  }
}

