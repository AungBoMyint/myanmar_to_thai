import 'package:flutter/material.dart';

import '../../model/lesson.dart';
import '../../model/phrases_ui_model.dart';
import '../constant/app_icon.dart';

const List<PhrasesUiModel> phrasesUiModelList = [
  PhrasesUiModel(
    imageIcon: AppIcon.newbie,
    text: "Beginner",
    color: Color(0XFFFF5364),
  ),
  PhrasesUiModel(
    imageIcon: AppIcon.phraseTravellerBasic,
    text: "Traveler Basics",
    color: Color(0XFF2EB118),
  ),
  PhrasesUiModel(
    imageIcon: AppIcon.phraseTravellerAdvanced,
    text: "Traveler Advanced",
    color: Color(0XFF1843B1),
  ),
  PhrasesUiModel(
    imageIcon: AppIcon.worldWide,
    text: "Expat",
    color: Color(0XFFB15818),
  ),
];

const List<Lesson> lessonList = [
  Lesson(title: "Numbers", image: AppIcon.oneTwoThree),
  Lesson(title: "Time & Date", image: AppIcon.clock),
  Lesson(title: "Basic Conversation", image: AppIcon.speak),
];
