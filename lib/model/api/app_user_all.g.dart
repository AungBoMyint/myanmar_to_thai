// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUserAll _$AppUserAllFromJson(Map<String, dynamic> json) => AppUserAll(
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => AppUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppUserAllToJson(AppUserAll instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
