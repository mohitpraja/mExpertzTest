import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexpertztest/feature/otp/otp_controller.dart';
import 'package:mexpertztest/theme/colors.dart';
import 'package:mexpertztest/widgets/custom_button.dart';
import 'package:mexpertztest/widgets/otp_input_field.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(18),
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: Get.back,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: KAppColor.primaryColor
                                  .withValues(alpha: 0.15),
                              child: Icon(
                                Icons.arrow_back,
                                color: KAppColor.primaryColor,
                              ),
                            )),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'OTP Verification',
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Enter the verification code we just sent on your email address',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: KAppColor.blueGrey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OtpInputBox(
                              length: 4,
                              onCompleted: (value) {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomButton(
                          text: 'Verify',
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
