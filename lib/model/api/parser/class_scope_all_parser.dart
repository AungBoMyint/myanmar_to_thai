import '../class_scope_all.dart';
import 'json_parser.dart';

class ClassScopeAllParser extends JsonParser<ClassScopeAll>
    with ObjectDecoder<ClassScopeAll> {
  @override
  Future<ClassScopeAll?> parseFromJson(Map<String, dynamic> json) async {
    final decoded = decodeJsonObject(json);
    return ClassScopeAll.fromJson(decoded);
  }
}
