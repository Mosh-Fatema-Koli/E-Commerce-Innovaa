
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/style.dart';

class SocialMediaButton extends StatelessWidget {
   SocialMediaButton({
    super.key,
    required this.icon,required this.text,required this.color,required this.onTab
  });
  String icon,text;
  Color color;
  Function() onTab;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:50.h,

      child: ElevatedButton(onPressed:onTab,
          style: ElevatedButton.styleFrom(
              backgroundColor:color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)
              )
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon,height:24.h,width: 24.h,fit: BoxFit.fill,)
              ,
              Text(text,style:CustomTextStyle.h3(fontWeight: FontWeight.w600),)
            ],)),
    );
  }
}

