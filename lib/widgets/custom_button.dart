import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexpertztest/theme/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 55,
      child: MaterialButton(
        shape: StadiumBorder(),
        padding: EdgeInsets.all(12),
        color: KAppColor.primaryColor,
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: KAppColor.white),
        ),
      ),
    );
  }
}
