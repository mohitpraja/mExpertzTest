import 'package:flutter/material.dart';
import 'package:mexpertztest/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final int? maxLength;
  final Widget? preFixIcon;
  final Widget? sufFixIcon;
  final String? hintText;
  final Color? prefixIconColor;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    this.keyboardType,
    this.maxLength,
    this.preFixIcon,
    this.hintText,
    this.prefixIconColor,
    this.controller, 
    this.sufFixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLength: maxLength,
      style: TextStyle(color: KAppColor.blueGrey),
      controller: controller,
      decoration: InputDecoration(
          counterText: "",
          prefixIcon: preFixIcon,
          suffixIcon: sufFixIcon,
          hintText: hintText,
          hintStyle: TextStyle(color: KAppColor.mediumGrey),
          prefixIconColor: prefixIconColor ?? KAppColor.blueGrey,
          contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: KAppColor.mediumGrey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: KAppColor.primaryColor))),
    );
  }
}