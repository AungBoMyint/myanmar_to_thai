import 'package:json_annotation/json_annotation.dart';

import 'app_user.dart';

part 'app_user_all.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUserAll {
  final int count;
  final List<AppUser> data;
  AppUserAll({required this.count, required this.data});

  factory AppUserAll.fromJson(Map<String, dynamic> json) =>
      _$AppUserAllFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserAllToJson(this);
}
