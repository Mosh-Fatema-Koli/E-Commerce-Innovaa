import 'package:ecommerce_app/widget/custom_button.dart';
import 'package:ecommerce_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_text.dart';
import '../../../utils/colors.dart';
import '../../../utils/style.dart';
import '../../../widget/custom_back_button.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

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
            Text(
              AppText.name,
              style: CustomTextStyle.h3(
                  fontWeight: FontWeight.w500,
                 ),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              hintText: AppText.typeYourName,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              AppText.howWasYourExperience,
              style: CustomTextStyle.h3(
                  fontWeight: FontWeight.w500,
                 ),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomTextField(
              hintText: AppText.describeYourExperience,
              maxLines: 10,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(AppText.star),
            SizedBox(
              height: 10.h,
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              unratedColor: AppColors.greyColor,
              itemCount: 5,
              ignoreGestures: false,
              itemSize: 30.w,
              itemPadding: EdgeInsets.symmetric(horizontal: 0.3.w),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            SizedBox(
              height: 80.h,
            ),
            CustomButton(text: AppText.submitReview, onTap: () {})
          ],
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: Text(
        AppText.addReview,

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
