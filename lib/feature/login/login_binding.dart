import 'package:get/get.dart';
import 'package:mexpertztest/feature/login/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
  }
  
}