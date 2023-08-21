import 'package:json_annotation/json_annotation.dart';

import 'class_scope.dart';
import 'level.dart';

part 'lesson_quiz.g.dart';

@JsonSerializable(explicitToJson: true)
class Lesson {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  @JsonKey(nullable: true)
  final String? image;
  @JsonKey(nullable: true)
  final ClassScope? classId;
  @JsonKey(nullable: true)
  final Level? levelId;
  @JsonKey(nullable: true)
  final bool? forQuestion;

  Lesson({
    required this.id,
    required this.name,
    required this.image,
    required this.classId,
    required this.levelId,
    required this.forQuestion,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
