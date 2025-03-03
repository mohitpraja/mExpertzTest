import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexpertztest/core/app_assets.dart';
import 'package:mexpertztest/feature/login/login_controller.dart';
import 'package:mexpertztest/firebase/firebase.dart';
import 'package:mexpertztest/routes/routes.dart';
import 'package:mexpertztest/theme/colors.dart';
import 'package:mexpertztest/widgets/custom_button.dart';
import 'package:mexpertztest/widgets/custom_text_field.dart';
import 'package:mexpertztest/widgets/social_icon.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(18),
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Center(
                      child: Image.asset(
                        AppAssets.image.appLogo,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Login to continue',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomTextField(
                          preFixIcon: Icon(
                            Icons.phone_android,
                            color: KAppColor.mediumGrey,
                          ),
                          hintText: 'Phone Number',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          text: 'Get otp',
                          onPressed: () => Get.toNamed(Routes.otp),
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
                            image: AppAssets.image.google, label: 'Google',onTap: () => Firebase.googleLogin(),),
                        SizedBox(
                          width: 20,
                        ),
                        socialIcon(
                            image: AppAssets.image.facebook, label: 'Facebook')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.signup),
                          child: Text(
                            "Signup".toUpperCase(),
                            style: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                                decorationColor: KAppColor
                                    .primaryColor, // Change the color of the underline
                                fontWeight: FontWeight.w600,
                                color: KAppColor.primaryColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(),
                  ],
                ),
              ),
            );
          }),
        )),
      ),
    );
  }
}
