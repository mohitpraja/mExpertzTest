// import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexpertztest/feature/onboard/onboard_controller.dart';
import 'package:mexpertztest/routes/routes.dart';
import 'package:mexpertztest/theme/colors.dart';

class OnboardView extends GetView<OnBoardController> {
  const OnboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KAppColor.primaryColor,
      body: PageView.builder(
        itemCount: controller.onboardList.length,
        controller: controller.pageController,
        onPageChanged: (value) => controller.pageIndex.value = value,
        itemBuilder: (context, index) {
          final data = controller.onboardList[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Image.asset(data['image']),
              Container(
                padding: EdgeInsets.all(25),
                height: Get.height * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      data['title'].toUpperCase(),
                      style: TextStyle(
                          color: KAppColor.secondaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      data['description'],
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Get.offAllNamed(Routes.login),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                                color: KAppColor.secondaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  controller.onboardList.length,
                                  (index) => Container(
                                        width: 16,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        height: 2,
                                        color:
                                            controller.pageIndex.value == index
                                                ? KAppColor.secondaryColor
                                                : Colors.black38,
                                      )),
                            )),
                        InkWell(
                          onTap: () {
                            if (controller.pageIndex.value == 2) {
                              Get.offAllNamed(Routes.login);
                            } else {
                              controller.pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            }
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: KAppColor.secondaryColor,
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              color: KAppColor.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
