import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mexpertztest/core/app_assets.dart';

class OnBoardController extends GetxController {

  PageController pageController = PageController();
  RxInt pageIndex = 0.obs;

  List onboardList = [
    {
      'title': 'Online Payment',
      'image': AppAssets.image.payment,
      'description':
          "lorem ipsum dolor sit amet, consectetur adipiscing elit. Phareta quam elementum masa, vivera Ut turpis consectetur"
    },
    {
      'title': 'Online Shopping',
      'image': AppAssets.image.shopping,
      'description':
          "lorem ipsum dolor sit amet, consectetur adipiscing elit. Phareta quam elementum masa, vivera Ut turpis consectetur"
    },
    {
      'title': 'Home Deliver Service',
      'image': AppAssets.image.delivery,
      'description':
          "lorem ipsum dolor sit amet, consectetur adipiscing elit. Phareta quam elementum masa, vivera Ut turpis consectetur"
    }
  ];
}
