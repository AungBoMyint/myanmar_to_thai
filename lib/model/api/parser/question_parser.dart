import '../question.dart';
import 'json_parser.dart';

class QuestionParser extends JsonParser<Question> with ObjectDecoder<Question> {
  @override
  Future<Question?> parseFromJson(Map<String, dynamic> json) async {
    final decoded = decodeJsonObject(json);
    return Question.fromJson(decoded);
  }
}
