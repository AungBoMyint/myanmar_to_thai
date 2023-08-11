import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_type.freezed.dart';

@freezed
class QuestionType with _$QuestionType {
  const factory QuestionType.selectRectangle() = _SelectRectangle;
  const factory QuestionType.selectCircle() = _Circle;
}
