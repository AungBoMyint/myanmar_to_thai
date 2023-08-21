// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      fbId: json['fbId'] as String,
      userName: json['userName'] as String,
      avatar: json['avatar'] as String? ??
          'https://cdn-icons-png.flaticon.com/128/4333/4333609.png',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? 'empty',
      role: json['role'] as int,
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'fbId': instance.fbId,
      'userName': instance.userName,
      'avatar': instance.avatar,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
    };
