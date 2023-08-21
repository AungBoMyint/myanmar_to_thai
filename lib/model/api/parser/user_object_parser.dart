import '../app_user.dart';
import 'json_parser.dart';

class UserObjectParser extends JsonParser<AppUser> with ObjectDecoder<AppUser> {
  @override
  Future<AppUser> parseFromJson(Map<String, dynamic> json) async {
    var decodeJson = decodeJsonObject(json);
    return AppUser.fromJson(decodeJson);
  }
}
