import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexpertztest/core/app_assets.dart';
import 'package:mexpertztest/feature/signup/signup_controller.dart';
import 'package:mexpertztest/firebase/firebase.dart';
import 'package:mexpertztest/theme/colors.dart';
import 'package:mexpertztest/widgets/custom_button.dart';
import 'package:mexpertztest/widgets/custom_text_field.dart';
import 'package:mexpertztest/widgets/social_icon.dart';

class SignupView extends GetView<SingupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                          onTap: Get.back,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                KAppColor.primaryColor.withValues(alpha: 0.15),
                            child: Icon(
                              Icons.arrow_back,
                              color: KAppColor.primaryColor,
                            ),
                          )),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Create Account',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      spacing: 20,
                      children: [
                        CustomTextField(
                          hintText: 'Email',
                          preFixIcon: Icon(
                            CupertinoIcons.mail,
                            color: KAppColor.mediumGrey,
                          ),
                        ),
                        CustomTextField(
                          hintText: 'Password',
                          sufFixIcon: Icon(
                            CupertinoIcons.eye_slash,
                            color: KAppColor.mediumGrey,
                          ),
                          preFixIcon: Icon(
                            CupertinoIcons.lock,
                            color: KAppColor.mediumGrey,
                          ),
                        ),
                        CustomTextField(
                          hintText: 'Repeat Password',
                          sufFixIcon: Icon(
                            CupertinoIcons.eye_slash,
                            color: KAppColor.mediumGrey,
                          ),
                          preFixIcon: Icon(
                            CupertinoIcons.lock,
                            color: KAppColor.mediumGrey,
                          ),
                        ),
                        CustomTextField(
                          hintText: 'Mobile Number',
                          preFixIcon: CountryCodePicker(
                            mode: CountryCodePickerMode.dialog,
                            onChanged: (country) {},
                            initialSelection: 'IN',
                            showFlag: true,
                            showCountryOnly: true,
                            showDropDownButton: true,
                          ),
                        ),
                        CustomButton(
                          text: 'Next',
                          onPressed: () {},
                        )
                      ],
                    ),
                    Text(
                      'Or Continue with',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialIcon(
                            image: AppAssets.image.apple, label: 'Apple'),
                        SizedBox(
                          width: 20,
                        ),
                        socialIcon(
                            image: AppAssets.image.google, label: 'Google',onTap: () => Firebase.googleLogin(),),
                        SizedBox(
                          width: 20,
                        ),
                        socialIcon(
                            image: AppAssets.image.facebook, label: 'Facebook')
                      ],
                    ),
                    SizedBox()
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
