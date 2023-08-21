import 'package:json_annotation/json_annotation.dart';

import 'class_scope.dart';

part 'level.g.dart';

@JsonSerializable(explicitToJson: true)
class Level {
  @JsonKey(name: "_id")
  final String id;
  final String name;
  @JsonKey(
    nullable: true,
  )
  final String? image;
  @JsonKey(nullable: true)
  final ClassScope? classId;
  Level(
      {required this.id,
      required this.name,
      required this.image,
      required this.classId});

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);
  Map<String, dynamic> toJson() => _$LevelToJson(this);
}
