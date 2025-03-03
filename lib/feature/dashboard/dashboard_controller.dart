import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mexpertztest/feature/home/home_view.dart';

class DashboardController extends GetxController{
  RxInt currIndex = 0.obs;

  List screens = [
    HomeView(),
    Center(child: Text('Category'),),
    Center(child: Text('Message'),),
    Center(child: Text('Cart'),),
    Center(child: Text('Profile'),),
  ];
}