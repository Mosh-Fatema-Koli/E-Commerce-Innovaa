import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/controller/nav_bar_controller.dart';
import 'package:ecommerce_app/helper/routes.dart';
import 'package:ecommerce_app/widget/drawer.dart';
import 'package:ecommerce_app/utils/app_text.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:ecommerce_app/utils/icons.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:ecommerce_app/widget/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import 'component/choose_category.dart';
import 'component/new_arraival.dart';
import 'component/search_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
              child: Text(
                "Hello",
                style: CustomTextStyle.customSize(
                    size: 28.sp,
                    fontWeight: FontWeight.w600,
                   ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
              child: Text(
                "Welcome to Laza",
                style: CustomTextStyle.h4(color: AppColors.greyColor),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            // <------------- Search section ------------>
            const SearchSection(),
            SizedBox(
              height: 10.h,
            ),

            // <------------- Category section ------------>
            ChooseCategory(),
       SizedBox(height:10.h,),
            // <------------- New Arraival section ------------>
            NewArraival()
          ],
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      leadingWidth: 65.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: CustomBackButton(
          onTap: () {
           // Scaffold.of(context).openDrawer();
            Get.find<NavBarController>().scaffoldKey.currentState!.openDrawer();
            print("Data");
          },
          icon: SvgPicture.asset(AppIcons.menuSvg, height: 25.h, width: 25.h,color:Theme.of(context).iconTheme.color,),
        ),
      ),
      actions: [
        CustomBackButton(
          onTap: () {
            Get.toNamed(Routes.cartScreen);
          },
          icon: SvgPicture.asset(
            AppIcons.bagSvg,
            height: 25.h,
            width: 25.h,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        SizedBox(
          width: 20.w,
        )
      ],
    );
  }
}



