import 'dart:async';

import 'package:get/get.dart';
import 'package:mexpertztest/core/helper.dart';
import 'package:mexpertztest/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () {
      if(appPrefs.isLogin){
        Get.offAllNamed(Routes.dashboard);
      }else{
        Get.offAllNamed(Routes.onboard);
      }
    });
    super.onInit();
  }
}
