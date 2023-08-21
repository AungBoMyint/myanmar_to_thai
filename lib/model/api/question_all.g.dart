// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionAll _$QuestionAllFromJson(Map<String, dynamic> json) => QuestionAll(
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionAllToJson(QuestionAll instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
