import 'package:json_annotation/json_annotation.dart';

import 'lesson_quiz.dart';

part 'lesson_all.g.dart';

@JsonSerializable(explicitToJson: true)
class LessonAll {
  final int count;
  final List<Lesson> data;
  LessonAll({required this.count, required this.data});

  factory LessonAll.fromJson(Map<String, dynamic> json) =>
      _$LessonAllFromJson(json);

  Map<String, dynamic> toJson() => _$LessonAllToJson(this);
}
