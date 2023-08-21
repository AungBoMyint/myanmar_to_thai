import '../question_all.dart';
import 'json_parser.dart';

class QuestionAllParser extends JsonParser<QuestionAll>
    with ObjectDecoder<QuestionAll> {
  @override
  Future<QuestionAll?> parseFromJson(Map<String, dynamic> json) async {
    final decoded = decodeJsonObject(json);
    return QuestionAll.fromJson(decoded);
  }
}
