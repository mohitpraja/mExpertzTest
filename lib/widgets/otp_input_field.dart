import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mexpertztest/theme/colors.dart';

class OtpInputBox extends StatefulWidget {
  final int length;
  final Function(String value) onCompleted;

  const OtpInputBox(
      {super.key, required this.length, required this.onCompleted});

  @override
  State<OtpInputBox> createState() => _OtpInputBoxState();
}

class _OtpInputBoxState extends State<OtpInputBox> {
  List<TextEditingController> controllers = [];
  String otpValue = '';
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.length; i++) {
      controllers.add(TextEditingController());
    }
  }

  void _updateOtpValue() {
    otpValue = controllers.map((controller) => controller.text).join();
    if (otpValue.length == widget.length) {
      FocusScope.of(context).unfocus();
      widget.onCompleted(otpValue);
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.length, (index) {
        return Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: controllers[index],
            textAlign: TextAlign.center,
            style: TextStyle(color: KAppColor.blueGrey),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.zero,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: KAppColor.mediumGrey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: KAppColor.primaryColor)),
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              if (value.length == 1 && index < widget.length - 1) {
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
              _updateOtpValue();
            },
          ),
        );
      }),
    );
  }
}