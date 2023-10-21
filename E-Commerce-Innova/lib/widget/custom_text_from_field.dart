import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/style.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.label,
    this.controller,
    this.focusNode,
    this.validator,
    this.keyboardType,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon
  });
  String? label;
  TextEditingController? controller;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  bool? obscureText;
  FocusNode? focusNode;
  Widget? suffixIcon;
  Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      focusNode: focusNode,
      style: CustomTextStyle.h4(
          fontWeight: FontWeight.w500,),
      decoration: InputDecoration(
          // hintText: AppText.userName,
          labelText: label,
          suffixIcon: suffixIcon,
          prefixIcon:prefixIcon,
          labelStyle: CustomTextStyle.h4(color: AppColors.greyColor),
          border: buildUnderlineInputBorder(),
          focusedBorder: buildUnderlineInputBorder(),
          enabledBorder: buildUnderlineInputBorder()),
    );
  }

  buildUnderlineInputBorder() {
    return UnderlineInputBorder( 
      borderSide: BorderSide(
       color: AppColors.borderColor,
      ),
    );
  }
}
