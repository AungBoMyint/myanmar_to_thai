import 'package:json_annotation/json_annotation.dart';

import 'class_scope.dart';
import 'lesson_quiz.dart';
import 'level.dart';

part 'content.g.dart';

@JsonSerializable(explicitToJson: true)
class Content {
  @JsonKey(name: "_id")
  final String id;
  final String myanmar;
  final String thai;
  final String pronuncation;
  final String image;
  final String audio;
  @JsonKey(nullable: true)
  final ClassScope? classId;
  @JsonKey(nullable: true)
  final Level? levelId;
  @JsonKey(nullable: true)
  final Lesson? lessonId;
  Content({
    required this.id,
    required this.myanmar,
    required this.thai,
    required this.pronuncation,
    required this.image,
    required this.audio,
    required this.classId,
    required this.levelId,
    required this.lessonId,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
