import '../level_all.dart';
import 'json_parser.dart';

class LevelAllParser extends JsonParser<LevelAll> with ObjectDecoder<LevelAll> {
  @override
  Future<LevelAll?> parseFromJson(Map<String, dynamic> json) async {
    final decode = decodeJsonObject(json);
    return LevelAll.fromJson(decode);
  }
}
