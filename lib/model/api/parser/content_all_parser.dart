import '../content_all.dart';
import 'json_parser.dart';

class ContentAllParser extends JsonParser<ContentAll>
    with ObjectDecoder<ContentAll> {
  @override
  Future<ContentAll?> parseFromJson(Map<String, dynamic> json) async {
    final decoded = decodeJsonObject(json);
    return ContentAll.fromJson(decoded);
  }
}
