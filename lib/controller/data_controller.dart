import 'package:get/get.dart';

class DataController extends GetxController {
  String level = "";
  String levelImage = "";
  void setLevel(String l, String lImage) {
    level = l;
    levelImage = lImage;
  }
}
