import '../content.dart';
import 'json_parser.dart';

class ContentParser extends JsonParser<Content> with ObjectDecoder<Content> {
  @override
  Future<Content?> parseFromJson(Map<String, dynamic> json) async {
    final decoded = decodeJsonObject(json);
    return Content.fromJson(decoded);
  }
}
