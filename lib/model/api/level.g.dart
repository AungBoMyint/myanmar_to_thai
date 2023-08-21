// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level _$LevelFromJson(Map<String, dynamic> json) => Level(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
      classId: json['classId'] == null
          ? null
          : ClassScope.fromJson(json['classId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'classId': instance.classId?.toJson(),
    };
