import 'package:get/get.dart';
import 'package:myanmar_to_thai/controller/level_controller.dart';

class LevelBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LevelController());
  }
}
