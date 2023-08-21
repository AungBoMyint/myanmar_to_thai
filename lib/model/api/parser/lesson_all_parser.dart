import '../lesson_all.dart';
import 'json_parser.dart';

class LessonAllParser extends JsonParser<LessonAll>
    with ObjectDecoder<LessonAll> {
  @override
  Future<LessonAll?> parseFromJson(Map<String, dynamic> json) async {
    final decoded = decodeJsonObject(json);
    return LessonAll.fromJson(decoded);
  }
}
