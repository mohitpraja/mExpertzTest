import 'package:get/get.dart';
import 'package:mexpertztest/feature/otp/otp_controller.dart';

class OtpBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(OtpController());
  }
}