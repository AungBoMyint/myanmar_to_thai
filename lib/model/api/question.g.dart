// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      id: json['_id'] as String,
      answer: json['answer'] as String,
      choiceItems: (json['choiceItems'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      classId: ClassScope.fromJson(json['classId'] as Map<String, dynamic>),
      question: json['question'] as String?,
      audioUrl: json['audioUrl'] as String?,
      lessonId: Lesson.fromJson(json['lessonId'] as Map<String, dynamic>),
      levelId: Level.fromJson(json['levelId'] as Map<String, dynamic>),
      qestionType: json['qestionType'] as String,
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'answer': instance.answer,
      'choiceItems': instance.choiceItems,
      'classId': instance.classId,
      'question': instance.question,
      'audioUrl': instance.audioUrl,
      'lessonId': instance.lessonId,
      'levelId': instance.levelId,
      'qestionType': instance.qestionType,
    };
