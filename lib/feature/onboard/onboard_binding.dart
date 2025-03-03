import 'package:get/get.dart';
import 'package:mexpertztest/feature/onboard/onboard_controller.dart';

class OnboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(OnBoardController());
  }
}