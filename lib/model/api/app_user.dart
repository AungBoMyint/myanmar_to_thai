import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    required String fbId,
    required String userName,
    @JsonKey(nullable: true, defaultValue: "https://cdn-icons-png.flaticon.com/128/4333/4333609.png")
        String? avatar,
    @JsonKey(nullable: true, defaultValue: "") String? email,
    @JsonKey(nullable: true, defaultValue: "empty") String? phone,
    required int role,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
