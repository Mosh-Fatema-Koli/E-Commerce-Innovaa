import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/icons.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,this.controller,this.prefixIcon,this.hintText,this.maxLines
  });
 final String? hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final int? maxLines;


  @override
  Widget build(BuildContext context) {
    return TextField(
      //  textAlign: TextAlign.center,
      controller: controller,
      maxLines:maxLines,
      decoration: InputDecoration(
          hintText:hintText,
          hintStyle: TextStyle(fontSize: 15.sp,color: AppColors.greyColor),
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical:maxLines==null?0: 10.h),
          prefixIconConstraints: BoxConstraints(
              minHeight: 20.h,
              minWidth: 40.w
          ),
          prefixIcon: prefixIcon,
          fillColor:Theme.of(context).secondaryHeaderColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          constraints:maxLines==null? BoxConstraints(maxHeight:50.h ):BoxConstraints()
      ),
    );
  }
}
