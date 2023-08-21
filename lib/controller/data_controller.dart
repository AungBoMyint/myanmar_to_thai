import 'package:get/get.dart';
import 'package:myanmar_to_thai/model/api/class_scope.dart';
import 'package:myanmar_to_thai/model/api/lesson_quiz.dart';
import 'package:myanmar_to_thai/model/api/level.dart';

class DataController extends GetxController {
  Rxn<ClassScope> selectedClass = Rxn<ClassScope>();
  Rxn<Level> selectedLevel = Rxn<Level>();
  Rxn<Lesson> selectedLesson = Rxn<Lesson>();

  void setClassLevel({required ClassScope classScope, required Level level}) {
    selectedClass.value = classScope;
    selectedLevel.value = level;
  }

  void setSelectedLesson(Lesson l) => selectedLesson.value = l;
}
