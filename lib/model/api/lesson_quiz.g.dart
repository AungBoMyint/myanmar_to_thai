// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      classId: json['classId'] == null
          ? null
          : ClassScope.fromJson(json['classId'] as Map<String, dynamic>),
      levelId: json['levelId'] == null
          ? null
          : Level.fromJson(json['levelId'] as Map<String, dynamic>),
      forQuestion: json['forQuestion'] as bool?,
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'classId': instance.classId?.toJson(),
      'levelId': instance.levelId?.toJson(),
      'forQuestion': instance.forQuestion,
    };
