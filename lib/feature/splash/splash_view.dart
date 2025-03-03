import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexpertztest/core/app_assets.dart';
import 'package:mexpertztest/feature/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppAssets.image.appLogo)
      ),
    );
  }
}
