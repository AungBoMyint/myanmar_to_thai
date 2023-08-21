import 'package:json_annotation/json_annotation.dart';

import 'question.dart';

part 'question_all.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionAll {
  final int count;
  final List<Question> data;
  QuestionAll({required this.count, required this.data});

  factory QuestionAll.fromJson(Map<String, dynamic> json) =>
      _$QuestionAllFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionAllToJson(this);
}
