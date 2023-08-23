import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:myanmar_to_thai/model/api/class_scope.dart';
import 'package:myanmar_to_thai/model/api/lesson_quiz.dart';
import 'package:myanmar_to_thai/model/api/level.dart';

class DataController extends GetxController {
  Rxn<ClassScope> selectedClass = Rxn<ClassScope>();
  Rxn<Level> selectedLevel = Rxn<Level>();
  Rxn<Lesson> selectedLesson = Rxn<Lesson>();
  StreamSubscription? _streamSubscription;
  Rxn<ConnectivityResult> connectivityResult = Rxn<ConnectivityResult>();

  void setClassLevel({required ClassScope classScope, required Level level}) {
    selectedClass.value = classScope;
    selectedLevel.value = level;
  }

  void setSelectedLesson(Lesson l) => selectedLesson.value = l;

  @override
  void onInit() {
    listenConnectivity();
    super.onInit();
  }

  Future<void> listenConnectivity() async {
    _streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      connectivityResult.value = result;
    });
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }
}
