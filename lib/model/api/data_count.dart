import 'package:json_annotation/json_annotation.dart';

part 'data_count.g.dart';

@JsonSerializable()
class DataCount {
  final int count;
  DataCount({required this.count});

  factory DataCount.fromJson(Map<String, dynamic> json) =>
      _$DataCountFromJson(json);
}
