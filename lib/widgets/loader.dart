import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexpertztest/theme/colors.dart';

class Loader {
  loader() {
    return Get.dialog(Center(
      child: CircularProgressIndicator(
        color: KAppColor.primaryColor,
        backgroundColor: KAppColor.secondaryColor,
      ),
    ));
  }
}
