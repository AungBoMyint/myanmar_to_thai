import 'package:get/get.dart';
import 'package:myanmar_to_thai/controller/question_controller.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(QuestionController());
  }
}
