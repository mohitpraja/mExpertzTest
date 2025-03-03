import 'package:get/get.dart';
import 'package:mexpertztest/feature/dashboard/dashboard_controller.dart';
import 'package:mexpertztest/feature/home/home_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(DashboardController());
  }
}
