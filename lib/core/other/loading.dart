import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

showLoading() async {
  await Get.dialog(
    Center(
      child: SizedBox(
        height: 50,
        width: 100,
        child: Center(
          child: LoadingAnimationWidget.flickr(
            leftDotColor: const Color(0xFF1A1A3F),
            rightDotColor: const Color.fromRGBO(244, 167, 41, 1),
            size: 50,
          ),
        ),
      ),
    ),
    barrierDismissible: false,
    barrierColor: Colors.white.withOpacity(0),
  );
}

hideLoading() {
  Get.back();
}
