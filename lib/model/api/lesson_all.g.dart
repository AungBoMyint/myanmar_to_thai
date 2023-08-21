// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonAll _$LessonAllFromJson(Map<String, dynamic> json) => LessonAll(
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LessonAllToJson(LessonAll instance) => <String, dynamic>{
      'count': instance.count,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
