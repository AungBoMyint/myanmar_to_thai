// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  List<String> get choiceItems => throw _privateConstructorUsedError;
  @JsonSerializable(explicitToJson: true)
  ClassScope get classId => throw _privateConstructorUsedError;
  @JsonSerializable(explicitToJson: true)
  Content get contentId => throw _privateConstructorUsedError;
  @JsonSerializable(explicitToJson: true)
  Lesson get lessonId => throw _privateConstructorUsedError;
  @JsonSerializable(explicitToJson: true)
  Level get levelId => throw _privateConstructorUsedError;
  String get qestionType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String answer,
      List<String> choiceItems,
      @JsonSerializable(explicitToJson: true) ClassScope classId,
      @JsonSerializable(explicitToJson: true) Content contentId,
      @JsonSerializable(explicitToJson: true) Lesson lessonId,
      @JsonSerializable(explicitToJson: true) Level levelId,
      String qestionType});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? choiceItems = null,
    Object? classId = null,
    Object? contentId = null,
    Object? lessonId = null,
    Object? levelId = null,
    Object? qestionType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      choiceItems: null == choiceItems
          ? _value.choiceItems
          : choiceItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      classId: null == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as ClassScope,
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as Content,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as Lesson,
      levelId: null == levelId
          ? _value.levelId
          : levelId // ignore: cast_nullable_to_non_nullable
              as Level,
      qestionType: null == qestionType
          ? _value.qestionType
          : qestionType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String answer,
      List<String> choiceItems,
      @JsonSerializable(explicitToJson: true) ClassScope classId,
      @JsonSerializable(explicitToJson: true) Content contentId,
      @JsonSerializable(explicitToJson: true) Lesson lessonId,
      @JsonSerializable(explicitToJson: true) Level levelId,
      String qestionType});
}

/// @nodoc
class __$$_QuestionCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$_Question>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? choiceItems = null,
    Object? classId = null,
    Object? contentId = null,
    Object? lessonId = null,
    Object? levelId = null,
    Object? qestionType = null,
  }) {
    return _then(_$_Question(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      choiceItems: null == choiceItems
          ? _value._choiceItems
          : choiceItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      classId: null == classId
          ? _value.classId
          : classId // ignore: cast_nullable_to_non_nullable
              as ClassScope,
      contentId: null == contentId
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as Content,
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as Lesson,
      levelId: null == levelId
          ? _value.levelId
          : levelId // ignore: cast_nullable_to_non_nullable
              as Level,
      qestionType: null == qestionType
          ? _value.qestionType
          : qestionType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Question implements _Question {
  _$_Question(
      {@JsonKey(name: "_id") required this.id,
      required this.answer,
      required final List<String> choiceItems,
      @JsonSerializable(explicitToJson: true) required this.classId,
      @JsonSerializable(explicitToJson: true) required this.contentId,
      @JsonSerializable(explicitToJson: true) required this.lessonId,
      @JsonSerializable(explicitToJson: true) required this.levelId,
      required this.qestionType})
      : _choiceItems = choiceItems;

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String answer;
  final List<String> _choiceItems;
  @override
  List<String> get choiceItems {
    if (_choiceItems is EqualUnmodifiableListView) return _choiceItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choiceItems);
  }

  @override
  @JsonSerializable(explicitToJson: true)
  final ClassScope classId;
  @override
  @JsonSerializable(explicitToJson: true)
  final Content contentId;
  @override
  @JsonSerializable(explicitToJson: true)
  final Lesson lessonId;
  @override
  @JsonSerializable(explicitToJson: true)
  final Level levelId;
  @override
  final String qestionType;

  @override
  String toString() {
    return 'Question(id: $id, answer: $answer, choiceItems: $choiceItems, classId: $classId, contentId: $contentId, lessonId: $lessonId, levelId: $levelId, qestionType: $qestionType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality()
                .equals(other._choiceItems, _choiceItems) &&
            (identical(other.classId, classId) || other.classId == classId) &&
            (identical(other.contentId, contentId) ||
                other.contentId == contentId) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.levelId, levelId) || other.levelId == levelId) &&
            (identical(other.qestionType, qestionType) ||
                other.qestionType == qestionType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      answer,
      const DeepCollectionEquality().hash(_choiceItems),
      classId,
      contentId,
      lessonId,
      levelId,
      qestionType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  factory _Question(
      {@JsonKey(name: "_id") required final String id,
      required final String answer,
      required final List<String> choiceItems,
      @JsonSerializable(explicitToJson: true) required final ClassScope classId,
      @JsonSerializable(explicitToJson: true) required final Content contentId,
      @JsonSerializable(explicitToJson: true) required final Lesson lessonId,
      @JsonSerializable(explicitToJson: true) required final Level levelId,
      required final String qestionType}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get answer;
  @override
  List<String> get choiceItems;
  @override
  @JsonSerializable(explicitToJson: true)
  ClassScope get classId;
  @override
  @JsonSerializable(explicitToJson: true)
  Content get contentId;
  @override
  @JsonSerializable(explicitToJson: true)
  Lesson get lessonId;
  @override
  @JsonSerializable(explicitToJson: true)
  Level get levelId;
  @override
  String get qestionType;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
