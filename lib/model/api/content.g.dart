// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      id: json['_id'] as String,
      myanmar: json['myanmar'] as String,
      thai: json['thai'] as String,
      pronuncation: json['pronuncation'] as String,
      image: json['image'] as String,
      audio: json['audio'] as String,
      classId: json['classId'] == null
          ? null
          : ClassScope.fromJson(json['classId'] as Map<String, dynamic>),
      levelId: json['levelId'] == null
          ? null
          : Level.fromJson(json['levelId'] as Map<String, dynamic>),
      lessonId: json['lessonId'] == null
          ? null
          : Lesson.fromJson(json['lessonId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      '_id': instance.id,
      'myanmar': instance.myanmar,
      'thai': instance.thai,
      'pronuncation': instance.pronuncation,
      'image': instance.image,
      'audio': instance.audio,
      'classId': instance.classId?.toJson(),
      'levelId': instance.levelId?.toJson(),
      'lessonId': instance.lessonId?.toJson(),
    };
