import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myanmar_to_thai/core/mock/mock_data.dart';
import 'package:myanmar_to_thai/model/remote/content.dart';

class LessonDetailController extends GetxController {
  PageController pageController = PageController();
  late RxList<Content> contents = <Content>[].obs;
  var currentIndex = 0.obs;

  bool hasPrevious() => currentIndex.value == 0 ? false : true;
  bool hasNext() => currentIndex.value == contents.length - 1 ? false : true;

  ///[index] is currentIndex
  void next() {
    currentIndex.value += 1;
    pageController.animateToPage(
      currentIndex.value,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  ///[currentIndex.value] is currentcurrentIndex.value
  void back() {
    currentIndex.value -= 1;
    pageController.animateToPage(
      currentIndex.value,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  void onInit() {
    contents.value = numberLessonContents;
    super.onInit();
  }
}
