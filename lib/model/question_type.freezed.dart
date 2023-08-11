// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() selectRectangle,
    required TResult Function() selectCircle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? selectRectangle,
    TResult? Function()? selectCircle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? selectRectangle,
    TResult Function()? selectCircle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectRectangle value) selectRectangle,
    required TResult Function(_Circle value) selectCircle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectRectangle value)? selectRectangle,
    TResult? Function(_Circle value)? selectCircle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectRectangle value)? selectRectangle,
    TResult Function(_Circle value)? selectCircle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionTypeCopyWith<$Res> {
  factory $QuestionTypeCopyWith(
          QuestionType value, $Res Function(QuestionType) then) =
      _$QuestionTypeCopyWithImpl<$Res, QuestionType>;
}

/// @nodoc
class _$QuestionTypeCopyWithImpl<$Res, $Val extends QuestionType>
    implements $QuestionTypeCopyWith<$Res> {
  _$QuestionTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SelectRectangleCopyWith<$Res> {
  factory _$$_SelectRectangleCopyWith(
          _$_SelectRectangle value, $Res Function(_$_SelectRectangle) then) =
      __$$_SelectRectangleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SelectRectangleCopyWithImpl<$Res>
    extends _$QuestionTypeCopyWithImpl<$Res, _$_SelectRectangle>
    implements _$$_SelectRectangleCopyWith<$Res> {
  __$$_SelectRectangleCopyWithImpl(
      _$_SelectRectangle _value, $Res Function(_$_SelectRectangle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SelectRectangle implements _SelectRectangle {
  const _$_SelectRectangle();

  @override
  String toString() {
    return 'QuestionType.selectRectangle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SelectRectangle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() selectRectangle,
    required TResult Function() selectCircle,
  }) {
    return selectRectangle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? selectRectangle,
    TResult? Function()? selectCircle,
  }) {
    return selectRectangle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? selectRectangle,
    TResult Function()? selectCircle,
    required TResult orElse(),
  }) {
    if (selectRectangle != null) {
      return selectRectangle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectRectangle value) selectRectangle,
    required TResult Function(_Circle value) selectCircle,
  }) {
    return selectRectangle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectRectangle value)? selectRectangle,
    TResult? Function(_Circle value)? selectCircle,
  }) {
    return selectRectangle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectRectangle value)? selectRectangle,
    TResult Function(_Circle value)? selectCircle,
    required TResult orElse(),
  }) {
    if (selectRectangle != null) {
      return selectRectangle(this);
    }
    return orElse();
  }
}

abstract class _SelectRectangle implements QuestionType {
  const factory _SelectRectangle() = _$_SelectRectangle;
}

/// @nodoc
abstract class _$$_CircleCopyWith<$Res> {
  factory _$$_CircleCopyWith(_$_Circle value, $Res Function(_$_Circle) then) =
      __$$_CircleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CircleCopyWithImpl<$Res>
    extends _$QuestionTypeCopyWithImpl<$Res, _$_Circle>
    implements _$$_CircleCopyWith<$Res> {
  __$$_CircleCopyWithImpl(_$_Circle _value, $Res Function(_$_Circle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Circle implements _Circle {
  const _$_Circle();

  @override
  String toString() {
    return 'QuestionType.selectCircle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Circle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() selectRectangle,
    required TResult Function() selectCircle,
  }) {
    return selectCircle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? selectRectangle,
    TResult? Function()? selectCircle,
  }) {
    return selectCircle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? selectRectangle,
    TResult Function()? selectCircle,
    required TResult orElse(),
  }) {
    if (selectCircle != null) {
      return selectCircle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectRectangle value) selectRectangle,
    required TResult Function(_Circle value) selectCircle,
  }) {
    return selectCircle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectRectangle value)? selectRectangle,
    TResult? Function(_Circle value)? selectCircle,
  }) {
    return selectCircle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectRectangle value)? selectRectangle,
    TResult Function(_Circle value)? selectCircle,
    required TResult orElse(),
  }) {
    if (selectCircle != null) {
      return selectCircle(this);
    }
    return orElse();
  }
}

abstract class _Circle implements QuestionType {
  const factory _Circle() = _$_Circle;
}
