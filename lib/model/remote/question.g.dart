// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      id: json['id'] as String,
      questionContentID: json['questionContentID'] as String,
      choiceItems: (json['choiceItems'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      answer: json['answer'] as String,
      questionType: json['questionType'] as String,
      classLevelLesson: json['classLevelLesson'] as String,
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionContentID': instance.questionContentID,
      'choiceItems': instance.choiceItems,
      'answer': instance.answer,
      'questionType': instance.questionType,
      'classLevelLesson': instance.classLevelLesson,
    };
