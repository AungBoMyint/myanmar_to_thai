/* import 'package:flutter/material.dart';
import 'package:myanmar_to_thai/model/remote/circle_position.dart';
import 'package:myanmar_to_thai/model/remote/content.dart';
import 'package:myanmar_to_thai/model/remote/question.dart';
import 'package:uuid/uuid.dart';

import '../../model/lesson_ui_model.dart';
import '../../model/phrases_ui_model.dart';
import '../constant/app_icon.dart';
import '../constant/constant.dart';

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

const List<LessonUiModel> lessonList = [
  LessonUiModel(title: "Numbers", image: AppIcon.oneTwoThree),
  LessonUiModel(title: "Time & Date", image: AppIcon.clock),
  LessonUiModel(title: "Basic Conversation", image: AppIcon.speak),
];

final List<Content> numberLessonContents = [
  Content(
    pronuncation: "",
    id: Uuid().v1(),
    myanmar: "တစ်",
    thai: "หนึ่ง",
    audio:
        "https://learnthaifromawhiteguy.com/speech/%E0%B8%AB%E0%B8%99%E0%B8%B6%E0%B9%88%E0%B8%87.mp3",
    image: "https://cdn-icons-png.flaticon.com/128/3601/3601002.png",
    classLevelLesson: "",
  ),
  Content(
    pronuncation: "",
    id: Uuid().v1(),
    myanmar: "နှစ်",
    thai: "สอง",
    audio:
        "https://learnthaifromawhiteguy.com/speech/%E0%B8%AA%E0%B8%AD%E0%B8%87.mp3",
    image: "https://cdn-icons-png.flaticon.com/128/8921/8921602.png",
    classLevelLesson: "",
  ),
  Content(
    pronuncation: "",
    id: Uuid().v1(),
    myanmar: "သုံး",
    thai: "สาม",
    audio:
        "https://learnthaifromawhiteguy.com/speech/%E0%B8%AA%E0%B8%B2%E0%B8%A1.mp3",
    image: "https://cdn-icons-png.flaticon.com/128/10979/10979011.png",
    classLevelLesson: "",
  ),
  Content(
    pronuncation: "",
    id: Uuid().v1(),
    myanmar: "လေး",
    thai: "สี่",
    audio: "",
    image: "https://cdn-icons-png.flaticon.com/128/9128/9128882.png",
    classLevelLesson: "",
  ),
  Content(
    pronuncation: "",
    id: Uuid().v1(),
    myanmar: "ငါး",
    thai: "ห้า",
    audio: "",
    image: "https://cdn-icons-png.flaticon.com/128/9251/9251240.png",
    classLevelLesson: "",
  ),
];

final List<Question> questionList = [
  Question(
    id: Uuid().v1(),
    questionType: selectRactangle,
    questionContentID: "ฝนตกแต่เช้า--F̄n tk tæ̀ chêā",
    choiceItems: [
      "ကျောင်းသို့သွားသည်",
      "အိပ်ယာထသည်",
      "မိုးရွာနေသည်",
      "ဖုန်းမြည်နေသည်"
    ],
    answer: "မိုးရွာနေသည်",
    classLevelLesson: '',
  ),
  Question(
    id: Uuid().v1(),
    questionType: selectRactangle,
    questionContentID: "คุณเป็นอย่างไร?--Khuṇ pĕn xỳāngrị?",
    choiceItems: ["အဆင်ပြေရဲ့လား", "ဘယ်မှာနေလဲ", "နေကောင်းလား", "ဘယ်အချိန်လဲ"],
    answer: "နေကောင်းလား",
    classLevelLesson: '',
  ),
  Question(
    id: Uuid().v1(),
    questionType: selectCircle,
    questionContentID: "สิบเอ็ด--S̄ib xĕd",
    choiceItems: ["၈", "၅", "၁၁", "၂"],
    answer: "၁၁",
    classLevelLesson: '',
  ),
];

List<CirclePosition> circlePositions = [
  CirclePosition(
    left: 40,
    top: 40,
  ),
  CirclePosition(
    right: 40,
    top: 40,
  ),
  CirclePosition(
    left: 40,
    bottom: 40,
  ),
  CirclePosition(
    right: 40,
    bottom: 40,
  )
];
 */

import '../../model/remote/circle_position.dart';

List<CirclePosition> circlePositions = [
  CirclePosition(
    left: 40,
    top: 40,
  ),
  CirclePosition(
    right: 40,
    top: 40,
  ),
  CirclePosition(
    left: 40,
    bottom: 40,
  ),
  CirclePosition(
    right: 40,
    bottom: 40,
  )
];
