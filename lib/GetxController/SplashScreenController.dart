import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_hub/Screen/HomeScreen.dart';

class SplashScreenController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nextPage();
  }

  nextPage(){
    Future.delayed(const Duration(seconds: 3),(){
      Get.off(const HomeScreen());
    });
  }
}