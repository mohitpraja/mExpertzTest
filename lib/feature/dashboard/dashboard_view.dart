import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexpertztest/feature/dashboard/dashboard_controller.dart';
import 'package:mexpertztest/theme/colors.dart';
import 'package:mexpertztest/theme/fonts.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.screens[controller.currIndex.value],
      ),
      bottomNavigationBar: SizedBox(
        height: 75,
        child: Obx(() => Theme(
              data: ThemeData(
                fontFamily: FF.lato,
                splashColor: Colors.transparent,
                colorScheme: ColorScheme.fromSeed(seedColor: KAppColor.primaryColor),
              ),
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: controller.currIndex.value,
                  selectedLabelStyle: TextStyle(height: 1.5, fontSize: 14),
                  unselectedLabelStyle: TextStyle(height: 1.5, fontSize: 14),
                  onTap: (value) => controller.currIndex.value = value,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.home), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard), label: 'Category'),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.chat_bubble_2),
                        label: 'Message'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart_outlined),
                        label: 'Cart'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: 'Profile'),
                  ]),
            )),
      ),
    );
  }
}
