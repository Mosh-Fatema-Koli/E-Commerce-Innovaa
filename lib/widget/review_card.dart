import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/style.dart';

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 40.h,
              width: 40.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFCCD9E0),
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/image/shirt.png",
                      ),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ronald Richards",
                      style: CustomTextStyle.h4(
                          fontWeight: FontWeight.w500,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height:5.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.clockSvg,
                          height: 15.h,
                          width: 15.h,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          " 13 Sep, 2020",
                          style: CustomTextStyle.h6(
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                )),
            SizedBox(
              width: 10.w,
            ),
            Column(

              children: [
                RichText(
                    text:TextSpan(
                        text:"4.8 ",
                        style:CustomTextStyle.h4(fontWeight: FontWeight.w500,),
                        children: [
                          TextSpan(
                            text:"rating",
                            style:CustomTextStyle.h6(color:AppColors.greyColor),


                          )
                        ]

                    )),
                SizedBox(height:5.h,),
                RatingBar.builder(
                  initialRating: 3,

                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  unratedColor: AppColors.greyColor,
                  ignoreGestures: true,
                  itemSize:12.sp,
                  itemPadding: EdgeInsets.symmetric(horizontal:0.3.w),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {

                  },
                )

              ],
            )

          ],
        ),
        SizedBox(height: 10.h,),
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet,Pellentesque malesuada eget vitae amet Pellentesque malesuada eget vitae amet",style: CustomTextStyle.h4(color: AppColors.greyColor,height:1.4),maxLines:2,overflow: TextOverflow.ellipsis,)
      ],
    );
  }
}