import 'package:flutter/material.dart';
import 'package:mexpertztest/theme/colors.dart';

GestureDetector socialIcon(
    {required String label, required String image, void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 100,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        shadowColor: KAppColor.mediumGrey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(image),
              SizedBox(
                height: 5,
              ),
              Text(
                label,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
