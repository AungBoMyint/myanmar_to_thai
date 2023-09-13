import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'class_scope.dart';
import 'content.dart';
import 'lesson_quiz.dart';
import 'level.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  factory Question({
    @JsonKey(name: "_id") required String id,
    required String answer,
    required List<String> choiceItems,
    @JsonSerializable(explicitToJson: true) required ClassScope classId,
/*     @JsonSerializable(explicitToJson: true, nullable: true) Content? contentId,
 */
    @JsonKey(nullable: true) String? question,
    @JsonKey(nullable: true) String? audioUrl,
    @JsonSerializable(explicitToJson: true) required Lesson lessonId,
    @JsonSerializable(explicitToJson: true) required Level levelId,
    required String qestionType,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
