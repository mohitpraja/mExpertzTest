import 'package:get/get.dart';
import 'package:mexpertztest/feature/signup/signup_controller.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SingupController());
  }
}