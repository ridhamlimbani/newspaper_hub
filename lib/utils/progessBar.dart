import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressBar {

  ProgressBar();

  static bool isShowing = false;

  show() {
    isShowing = true;
    return showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) => WillPopScope(
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          content: Container(
            alignment: Alignment.center,
            height: 48,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2)),
                SizedBox(width: 24),
                Text("Please wait..."),
              ],
            ),
          ),
        ),
        onWillPop: () async => false,
      ),
    );
  }

  hide() {
    if (isShowing) {
      isShowing = false;
      Get.back();
    }
  }
}