// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelAll _$LevelAllFromJson(Map<String, dynamic> json) => LevelAll(
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Level.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LevelAllToJson(LevelAll instance) => <String, dynamic>{
      'count': instance.count,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
