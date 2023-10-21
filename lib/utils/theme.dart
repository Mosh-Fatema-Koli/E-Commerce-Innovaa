import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:flutter/material.dart';


class Style {

  static ThemeData themeData( bool isDarkTheme,BuildContext context){
    return ThemeData(
        scaffoldBackgroundColor:isDarkTheme?AppColors.darkBgColor:AppColors.bgColor,// scaffold bg color change
        cardColor: isDarkTheme?AppColors.darkButtonColor:AppColors.bgColor,//  card color change
        canvasColor:isDarkTheme?AppColors.darkBgColor:AppColors.bgColor,// drawer color change
        fontFamily: "inter",
        secondaryHeaderColor: isDarkTheme?AppColors.darkButtonColor:AppColors.greyButtonColor ,
        dividerColor: AppColors.borderColor,
        iconTheme: IconThemeData(
          color: isDarkTheme?AppColors.darkHeaderTextColor:AppColors.headerTextColor
        ),
        textTheme: Theme.of(context).textTheme.apply(bodyColor:isDarkTheme?AppColors.darkHeaderTextColor:AppColors.headerTextColor,displayColor: Colors.red),

    appBarTheme: AppBarTheme(
        backgroundColor:isDarkTheme?AppColors.darkBgColor:AppColors.bgColor,
        titleTextStyle:  CustomTextStyle.h3(fontWeight: FontWeight.w600,color:isDarkTheme?AppColors.darkHeaderTextColor:AppColors.headerTextColor),
        elevation: 0
      )
    );
  }


}