import 'package:get/get.dart';
import 'package:myanmar_to_thai/controller/lesson_detail_controller.dart';

class LessonBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LessonDetailController());
  }
}
