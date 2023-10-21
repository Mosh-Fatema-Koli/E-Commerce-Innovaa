import 'package:ecommerce_app/helper/routes.dart';
import 'package:ecommerce_app/widget/custom_snac_bar.dart';
import 'package:get/get.dart';
import '../controller/auth/auth_controller.dart';


class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) {

    if(response.statusCode != 200){
      if(response.statusCode == 401) {
       // Get.find<AuthController>().clearSharedData();
        Get.offAllNamed(Routes.splashScreen);
      }else {
        showCustomSnackBar(response.statusText!, getXSnackBar: getXSnackBar);
      }

    }


  }
}