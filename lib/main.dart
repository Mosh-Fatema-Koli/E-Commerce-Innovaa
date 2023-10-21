import 'package:ecommerce_app/helper/get_di.dart' as di;
import 'package:ecommerce_app/helper/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'controller/theme_controller.dart';

void main()async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final _themeController=Get.put(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _themeController.getCurrentAppTheme();
   // _themeController.setDarkTheme(_themeController.isDarkTheme.value);
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return Obx(()=>
           GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Ecommerce Project',
            // You can use the library anywhere in the app even in theme

            // theme: ThemeData(
            //   scaffoldBackgroundColor: AppColors.bgColor,
            //   fontFamily: "inter",
            //     textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.blue,displayColor: Colors.red),
            //     hintColor: Colors.red,
            //   primarySwatch: Colors.blue,
            //   appBarTheme: AppBarTheme(
            //     backgroundColor: AppColors.bgColor,
            //     elevation: 0
            //   )
            //
            // ),
             theme: Style.themeData(_themeController.isDarkTheme.value, context),
            initialRoute: Routes.splashScreen,
            getPages: pages,
          ),
        );
      },

    );
  }
}
