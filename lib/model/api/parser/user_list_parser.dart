import '../app_user_all.dart';
import 'json_parser.dart';

class UserListParser extends JsonParser<AppUserAll>
    with ObjectDecoder<AppUserAll> {
  @override
  Future<AppUserAll> parseFromJson(Map<String, dynamic> json) async {
    var decodeJson = decodeJsonObject(json);
    return AppUserAll.fromJson(decodeJson);
  }
}
