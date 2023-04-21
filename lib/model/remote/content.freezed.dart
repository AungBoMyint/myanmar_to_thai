// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
mixin _$Content {
  String get id => throw _privateConstructorUsedError;
  String get myanmar => throw _privateConstructorUsedError;
  String get thai => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String get audio => throw _privateConstructorUsedError;
  String get classLevelLesson => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res, Content>;
  @useResult
  $Res call(
      {String id,
      String myanmar,
      String thai,
      String? image,
      String audio,
      String classLevelLesson});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res, $Val extends Content>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? myanmar = null,
    Object? thai = null,
    Object? image = freezed,
    Object? audio = null,
    Object? classLevelLesson = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      myanmar: null == myanmar
          ? _value.myanmar
          : myanmar // ignore: cast_nullable_to_non_nullable
              as String,
      thai: null == thai
          ? _value.thai
          : thai // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      classLevelLesson: null == classLevelLesson
          ? _value.classLevelLesson
          : classLevelLesson // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContentCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$$_ContentCopyWith(
          _$_Content value, $Res Function(_$_Content) then) =
      __$$_ContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String myanmar,
      String thai,
      String? image,
      String audio,
      String classLevelLesson});
}

/// @nodoc
class __$$_ContentCopyWithImpl<$Res>
    extends _$ContentCopyWithImpl<$Res, _$_Content>
    implements _$$_ContentCopyWith<$Res> {
  __$$_ContentCopyWithImpl(_$_Content _value, $Res Function(_$_Content) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? myanmar = null,
    Object? thai = null,
    Object? image = freezed,
    Object? audio = null,
    Object? classLevelLesson = null,
  }) {
    return _then(_$_Content(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      myanmar: null == myanmar
          ? _value.myanmar
          : myanmar // ignore: cast_nullable_to_non_nullable
              as String,
      thai: null == thai
          ? _value.thai
          : thai // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      classLevelLesson: null == classLevelLesson
          ? _value.classLevelLesson
          : classLevelLesson // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Content implements _Content {
  _$_Content(
      {required this.id,
      required this.myanmar,
      required this.thai,
      this.image,
      required this.audio,
      required this.classLevelLesson});

  factory _$_Content.fromJson(Map<String, dynamic> json) =>
      _$$_ContentFromJson(json);

  @override
  final String id;
  @override
  final String myanmar;
  @override
  final String thai;
  @override
  final String? image;
  @override
  final String audio;
  @override
  final String classLevelLesson;

  @override
  String toString() {
    return 'Content(id: $id, myanmar: $myanmar, thai: $thai, image: $image, audio: $audio, classLevelLesson: $classLevelLesson)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Content &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.myanmar, myanmar) || other.myanmar == myanmar) &&
            (identical(other.thai, thai) || other.thai == thai) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.classLevelLesson, classLevelLesson) ||
                other.classLevelLesson == classLevelLesson));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, myanmar, thai, image, audio, classLevelLesson);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContentCopyWith<_$_Content> get copyWith =>
      __$$_ContentCopyWithImpl<_$_Content>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentToJson(
      this,
    );
  }
}

abstract class _Content implements Content {
  factory _Content(
      {required final String id,
      required final String myanmar,
      required final String thai,
      final String? image,
      required final String audio,
      required final String classLevelLesson}) = _$_Content;

  factory _Content.fromJson(Map<String, dynamic> json) = _$_Content.fromJson;

  @override
  String get id;
  @override
  String get myanmar;
  @override
  String get thai;
  @override
  String? get image;
  @override
  String get audio;
  @override
  String get classLevelLesson;
  @override
  @JsonKey(ignore: true)
  _$$_ContentCopyWith<_$_Content> get copyWith =>
      throw _privateConstructorUsedError;
}
