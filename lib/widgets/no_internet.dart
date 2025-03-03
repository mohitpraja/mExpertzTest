import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternet extends GetView {
  const NoInternet({super.key, this.onTryAgain});
  final void Function()? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300, shape: BoxShape.circle),
              child: Icon(
                Icons.wifi_off,
                size: 50,
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "You're offline",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: Get.width*0.75,
              child: Text(
                "Check your connection & get back when you're online",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
