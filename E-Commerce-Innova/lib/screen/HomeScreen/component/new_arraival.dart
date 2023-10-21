import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../utils/app_text.dart';
import '../../../utils/colors.dart';
import '../../../utils/style.dart';
import '../../../widget/product_card.dart';

class NewArraival extends StatelessWidget {
  const NewArraival({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppText.newArraival ,
                style: CustomTextStyle.h3(
                    fontWeight: FontWeight.w500,
                   ),
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    // minimumSize: Size.zero
                  ),
                  child: Text(
                    AppText.viewAll,
                    style:
                    CustomTextStyle.h5(color: AppColors.greyColor),
                  ))
            ],
          ),
        ),
        MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 15.w,
          padding: EdgeInsets.symmetric(horizontal:20.w),
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ProductCard();
          },
        )





      ],
    );
  }
}

