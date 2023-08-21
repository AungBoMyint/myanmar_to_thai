// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_scope_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassScopeAll _$ClassScopeAllFromJson(Map<String, dynamic> json) =>
    ClassScopeAll(
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => ClassScope.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClassScopeAllToJson(ClassScopeAll instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
