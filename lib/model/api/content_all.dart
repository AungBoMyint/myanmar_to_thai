import 'package:json_annotation/json_annotation.dart';

import 'content.dart';

part 'content_all.g.dart';

@JsonSerializable(explicitToJson: true)
class ContentAll {
  final int count;
  final List<Content> data;
  ContentAll({required this.count, required this.data});

  factory ContentAll.fromJson(Map<String, dynamic> json) =>
      _$ContentAllFromJson(json);
  Map<String, dynamic> toJson() => _$ContentAllToJson(this);
}
