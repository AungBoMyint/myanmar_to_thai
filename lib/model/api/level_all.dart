import 'package:json_annotation/json_annotation.dart';

import 'level.dart';

part 'level_all.g.dart';

@JsonSerializable(explicitToJson: true)
class LevelAll {
  final int count;
  final List<Level> data;
  LevelAll({required this.count, required this.data});

  factory LevelAll.fromJson(Map<String, dynamic> json) =>
      _$LevelAllFromJson(json);

  Map<String, dynamic> toJson() => _$LevelAllToJson(this);
}
