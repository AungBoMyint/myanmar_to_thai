import '../lesson_quiz.dart';
import 'json_parser.dart';

class LessonParser extends JsonParser<Lesson> with ObjectDecoder<Lesson> {
  @override
  Future<Lesson?> parseFromJson(Map<String, dynamic> json) async {
    final decoded = decodeJsonObject(json);
    return Lesson.fromJson(decoded);
  }
}
