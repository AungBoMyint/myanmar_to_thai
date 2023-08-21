import '../class_scope.dart';
import 'json_parser.dart';

class ClassScopeParser extends JsonParser<ClassScope>
    with ObjectDecoder<ClassScope> {
  @override
  Future<ClassScope?> parseFromJson(Map<String, dynamic> json) async {
    final decode = decodeJsonObject(json);
    return ClassScope.fromJson(decode);
  }
}
