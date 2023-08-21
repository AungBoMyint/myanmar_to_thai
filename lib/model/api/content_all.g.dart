// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentAll _$ContentAllFromJson(Map<String, dynamic> json) => ContentAll(
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentAllToJson(ContentAll instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
