import 'dart:math';

import 'package:flutter/material.dart';

class KAppColor {
  static Color primaryColor = Color(0xff1A9EB7);
  static Color secondaryColor = Color(0xffFFAF00);
  static Color blueGrey = const Color(0xff64748b);
  static Color mediumGrey = const Color(0xffcbd5e1);
  static Color white = Colors.white;
  static Color getRandomColor() {
  Random random = Random();
  int red = random.nextInt(256); // 0 to 255
  int green = random.nextInt(256); // 0 to 255
  int blue = random.nextInt(256); // 0 to 255

  return Color.fromARGB(255, red, green, blue);
}
}
