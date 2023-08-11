// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Level _$LevelFromJson(Map<String, dynamic> json) {
  return _Level.fromJson(json);
}

/// @nodoc
mixin _$Level {
  String get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get classID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LevelCopyWith<Level> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelCopyWith<$Res> {
  factory $LevelCopyWith(Level value, $Res Function(Level) then) =
      _$LevelCopyWithImpl<$Res, Level>;
  @useResult
  $Res call({String id, String image, String text, String classID});
}

/// @nodoc
class _$LevelCopyWithImpl<$Res, $Val extends Level>
    implements $LevelCopyWith<$Res> {
  _$LevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? text = null,
    Object? classID = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      classID: null == classID
          ? _value.classID
          : classID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LevelCopyWith<$Res> implements $LevelCopyWith<$Res> {
  factory _$$_LevelCopyWith(_$_Level value, $Res Function(_$_Level) then) =
      __$$_LevelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String image, String text, String classID});
}

/// @nodoc
class __$$_LevelCopyWithImpl<$Res> extends _$LevelCopyWithImpl<$Res, _$_Level>
    implements _$$_LevelCopyWith<$Res> {
  __$$_LevelCopyWithImpl(_$_Level _value, $Res Function(_$_Level) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? text = null,
    Object? classID = null,
  }) {
    return _then(_$_Level(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      classID: null == classID
          ? _value.classID
          : classID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Level implements _Level {
  _$_Level(
      {required this.id,
      required this.image,
      required this.text,
      required this.classID});

  factory _$_Level.fromJson(Map<String, dynamic> json) =>
      _$$_LevelFromJson(json);

  @override
  final String id;
  @override
  final String image;
  @override
  final String text;
  @override
  final String classID;

  @override
  String toString() {
    return 'Level(id: $id, image: $image, text: $text, classID: $classID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Level &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.classID, classID) || other.classID == classID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image, text, classID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LevelCopyWith<_$_Level> get copyWith =>
      __$$_LevelCopyWithImpl<_$_Level>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LevelToJson(
      this,
    );
  }
}

abstract class _Level implements Level {
  factory _Level(
      {required final String id,
      required final String image,
      required final String text,
      required final String classID}) = _$_Level;

  factory _Level.fromJson(Map<String, dynamic> json) = _$_Level.fromJson;

  @override
  String get id;
  @override
  String get image;
  @override
  String get text;
  @override
  String get classID;
  @override
  @JsonKey(ignore: true)
  _$$_LevelCopyWith<_$_Level> get copyWith =>
      throw _privateConstructorUsedError;
}
