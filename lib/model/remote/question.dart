import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  factory Question({
    required String id,
    required String questionContentID, //"content's id"
    required List<String> choiceItems,
    required String answer,
    required String classLevelLesson, //classID-levelID-lessonID
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
