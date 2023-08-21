import '../data_count.dart';
import 'json_parser.dart';

class DataCountParser extends JsonParser<DataCount>
    with ObjectDecoder<DataCount> {
  @override
  Future<DataCount?> parseFromJson(Map<String, dynamic> json) async {
    final decoded = decodeJsonObject(json);
    return DataCount.fromJson(decoded);
  }
}
