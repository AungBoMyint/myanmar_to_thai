// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Lesson _$$_LessonFromJson(Map<String, dynamic> json) => _$_Lesson(
      id: json['id'] as String,
      text: json['text'] as String,
      image: json['image'] as String,
      levelID: json['levelID'] as String,
      classAndLevel: json['classAndLevel'] as String,
    );

Map<String, dynamic> _$$_LessonToJson(_$_Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'image': instance.image,
      'levelID': instance.levelID,
      'classAndLevel': instance.classAndLevel,
    };
