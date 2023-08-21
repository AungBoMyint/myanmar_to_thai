import '../level.dart';
import 'json_parser.dart';

class LevelParser extends JsonParser<Level> with ObjectDecoder<Level> {
  @override
  Future<Level?> parseFromJson(Map<String, dynamic> json) async {
    final decode = decodeJsonObject(json);
    return Level.fromJson(decode);
  }
}
