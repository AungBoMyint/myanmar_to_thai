// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String get fbId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(
      nullable: true,
      defaultValue: "https://cdn-icons-png.flaticon.com/128/4333/4333609.png")
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(nullable: true, defaultValue: "")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(nullable: true, defaultValue: "empty")
  String? get phone => throw _privateConstructorUsedError;
  int get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String fbId,
      String userName,
      @JsonKey(
          nullable: true,
          defaultValue:
              "https://cdn-icons-png.flaticon.com/128/4333/4333609.png")
          String? avatar,
      @JsonKey(nullable: true, defaultValue: "")
          String? email,
      @JsonKey(nullable: true, defaultValue: "empty")
          String? phone,
      int role});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fbId = null,
    Object? userName = null,
    Object? avatar = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      fbId: null == fbId
          ? _value.fbId
          : fbId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fbId,
      String userName,
      @JsonKey(
          nullable: true,
          defaultValue:
              "https://cdn-icons-png.flaticon.com/128/4333/4333609.png")
          String? avatar,
      @JsonKey(nullable: true, defaultValue: "")
          String? email,
      @JsonKey(nullable: true, defaultValue: "empty")
          String? phone,
      int role});
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$_AppUser>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fbId = null,
    Object? userName = null,
    Object? avatar = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? role = null,
  }) {
    return _then(_$_AppUser(
      fbId: null == fbId
          ? _value.fbId
          : fbId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser implements _AppUser {
  _$_AppUser(
      {required this.fbId,
      required this.userName,
      @JsonKey(
          nullable: true,
          defaultValue:
              "https://cdn-icons-png.flaticon.com/128/4333/4333609.png")
          this.avatar,
      @JsonKey(nullable: true, defaultValue: "")
          this.email,
      @JsonKey(nullable: true, defaultValue: "empty")
          this.phone,
      required this.role});

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  @override
  final String fbId;
  @override
  final String userName;
  @override
  @JsonKey(
      nullable: true,
      defaultValue: "https://cdn-icons-png.flaticon.com/128/4333/4333609.png")
  final String? avatar;
  @override
  @JsonKey(nullable: true, defaultValue: "")
  final String? email;
  @override
  @JsonKey(nullable: true, defaultValue: "empty")
  final String? phone;
  @override
  final int role;

  @override
  String toString() {
    return 'AppUser(fbId: $fbId, userName: $userName, avatar: $avatar, email: $email, phone: $phone, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUser &&
            (identical(other.fbId, fbId) || other.fbId == fbId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fbId, userName, avatar, email, phone, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  factory _AppUser(
      {required final String fbId,
      required final String userName,
      @JsonKey(
          nullable: true,
          defaultValue:
              "https://cdn-icons-png.flaticon.com/128/4333/4333609.png")
          final String? avatar,
      @JsonKey(nullable: true, defaultValue: "")
          final String? email,
      @JsonKey(nullable: true, defaultValue: "empty")
          final String? phone,
      required final int role}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  String get fbId;
  @override
  String get userName;
  @override
  @JsonKey(
      nullable: true,
      defaultValue: "https://cdn-icons-png.flaticon.com/128/4333/4333609.png")
  String? get avatar;
  @override
  @JsonKey(nullable: true, defaultValue: "")
  String? get email;
  @override
  @JsonKey(nullable: true, defaultValue: "empty")
  String? get phone;
  @override
  int get role;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
