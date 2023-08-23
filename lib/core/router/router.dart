import 'package:get/get.dart';
import 'package:myanmar_to_thai/bin/lesson_binding.dart';
import 'package:myanmar_to_thai/bin/question_binding.dart';
import 'package:myanmar_to_thai/view/pages/complete_page.dart';
import 'package:myanmar_to_thai/view/pages/lesson_detail_page.dart';
import 'package:myanmar_to_thai/view/pages/level_detail_page.dart';
import 'package:myanmar_to_thai/view/pages/question_page.dart';

import '../../bin/level_binding.dart';
import '../../view/pages/home_page.dart';
import '../../view/pages/profile_page.dart';

const String homePage = "/";
const String profilePage = "/profile";
const String levelDetailPage = "/level_detail";
const String lessonDetailPage = "/lesson_detail";
const String questionPage = "/question";
const String completePage = "/complete";

List<GetPage> routes = [
  GetPage(name: homePage, page: () => const HomePage()),
  GetPage(name: completePage, page: () => const CompletePage()),
  GetPage(
    name: levelDetailPage,
    page: () => const LevelDetailPage(),
    binding: LevelBinding(),
  ),
  GetPage(
      name: lessonDetailPage,
      page: () => const LessonDetailPage(),
      binding: LessonBinding()),
  GetPage(
      name: questionPage,
      page: () => const QuestionPage(),
      binding: QuestionBinding()),
];
