import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_hub/GetxController/SplashScreenController.dart';
import 'package:newspaper_hub/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.white70,
        body: GetBuilder(
          init: SplashScreenController(),
          builder: (controller) {
            return Center(
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Wallpaper",
                      style: TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Fontmirror"),
                    ),
                    TextSpan(
                      text: "Hub",
                      style: TextStyle(
                          color: AppColor.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Fontmirror"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
