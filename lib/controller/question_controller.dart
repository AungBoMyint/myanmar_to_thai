import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myanmar_to_thai/core/constant/constant.dart';
import 'package:myanmar_to_thai/core/mock/mock_data.dart';
import 'package:myanmar_to_thai/core/router/router.dart';
import 'package:myanmar_to_thai/model/remote/question.dart';
import 'package:myanmar_to_thai/view/widgets/core.dart';

class QuestionController extends GetxController {
  PageController pageController = PageController();
  String lesson = "";
  String lessonImage = "";
  RxList<Question> questions = <Question>[].obs;
  var currentIndex = 0.obs;
  var selectedAnswer = "".obs;
  var isPressed = false.obs;

  bool hasPrevious() => currentIndex.value == 0 ? false : true;
  bool hasNext() => currentIndex.value == questions.length - 1 ? false : true;

  void selectAnswer(String inputAnswer) {
    selectedAnswer.value = inputAnswer;
    isPressed.value = true;
    //Need to check answer if correct or not
    if (selectedAnswer.value != questions[currentIndex.value].answer) {
      //if not equal,show "Try Again"
      Get.bottomSheet(
          TryAgainOrContinueWidget(
            color: Colors.red,
            onPressed: () {
              //we shuffle previous optinAnswerlist

              var currentQ = questions[currentIndex.value];
              var list = currentQ.choiceItems.map((e) => e).toList();
              list.shuffle();
              currentQ = currentQ.copyWith(
                choiceItems: list,
              );
              questions[currentIndex.value] = currentQ;
              reset();
              Get.back();
            },
            alternativeText:
                retryAlternatives[Random().nextInt(retryAlternatives.length)],
            buttonText: "TRY AGAIN",
          ),
          isDismissible: false,
          barrierColor: Colors.black45,
          backgroundColor: Colors.white,
          elevation: 3,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )));
    } else {
      //Success BottomSheet
      Get.bottomSheet(
          TryAgainOrContinueWidget(
            color: Colors.green,
            onPressed: () {
              reset();
              //BottomSheet Dismiss
              if (Get.isBottomSheetOpen == true) Get.back();
              //if has Next,we go next
              if (hasNext()) {
                next();
              } else {
                Get.toNamed(completePage, arguments: {
                  "title": completeQuizTitleAlternatives[
                      Random().nextInt(completeQuizTitleAlternatives.length)],
                  "description": completeQuizDescriptionAlternatives[Random()
                      .nextInt(completeQuizDescriptionAlternatives.length)],
                });
              }
            },
            alternativeText: successAlternatives[
                Random().nextInt(successAlternatives.length)],
            buttonText: "CONTINUE",
          ),
          isDismissible: false,
          barrierColor: Colors.black45,
          backgroundColor: Colors.white,
          elevation: 3,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )));
    }
  }

  void reset() {
    isPressed.value = false;
    selectedAnswer = "".obs;
  }

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
    questions.value = questionList;
    super.onInit();
  }
}
