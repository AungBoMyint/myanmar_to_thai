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
  String get id => throw _privateConstructorUsedError;
  String get questionContentID =>
      throw _privateConstructorUsedError; //"content's id"
  List<String> get choiceItems => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get questionType => throw _privateConstructorUsedError;
  String get classLevelLesson => throw _privateConstructorUsedError;

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
      {String id,
      String questionContentID,
      List<String> choiceItems,
      String answer,
      String questionType,
      String classLevelLesson});
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
    Object? questionContentID = null,
    Object? choiceItems = null,
    Object? answer = null,
    Object? questionType = null,
    Object? classLevelLesson = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionContentID: null == questionContentID
          ? _value.questionContentID
          : questionContentID // ignore: cast_nullable_to_non_nullable
              as String,
      choiceItems: null == choiceItems
          ? _value.choiceItems
          : choiceItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String,
      classLevelLesson: null == classLevelLesson
          ? _value.classLevelLesson
          : classLevelLesson // ignore: cast_nullable_to_non_nullable
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
      {String id,
      String questionContentID,
      List<String> choiceItems,
      String answer,
      String questionType,
      String classLevelLesson});
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
    Object? questionContentID = null,
    Object? choiceItems = null,
    Object? answer = null,
    Object? questionType = null,
    Object? classLevelLesson = null,
  }) {
    return _then(_$_Question(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionContentID: null == questionContentID
          ? _value.questionContentID
          : questionContentID // ignore: cast_nullable_to_non_nullable
              as String,
      choiceItems: null == choiceItems
          ? _value._choiceItems
          : choiceItems // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      questionType: null == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
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
class _$_Question implements _Question {
  _$_Question(
      {required this.id,
      required this.questionContentID,
      required final List<String> choiceItems,
      required this.answer,
      required this.questionType,
      required this.classLevelLesson})
      : _choiceItems = choiceItems;

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionFromJson(json);

  @override
  final String id;
  @override
  final String questionContentID;
//"content's id"
  final List<String> _choiceItems;
//"content's id"
  @override
  List<String> get choiceItems {
    if (_choiceItems is EqualUnmodifiableListView) return _choiceItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choiceItems);
  }

  @override
  final String answer;
  @override
  final String questionType;
  @override
  final String classLevelLesson;

  @override
  String toString() {
    return 'Question(id: $id, questionContentID: $questionContentID, choiceItems: $choiceItems, answer: $answer, questionType: $questionType, classLevelLesson: $classLevelLesson)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionContentID, questionContentID) ||
                other.questionContentID == questionContentID) &&
            const DeepCollectionEquality()
                .equals(other._choiceItems, _choiceItems) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.classLevelLesson, classLevelLesson) ||
                other.classLevelLesson == classLevelLesson));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      questionContentID,
      const DeepCollectionEquality().hash(_choiceItems),
      answer,
      questionType,
      classLevelLesson);

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
      {required final String id,
      required final String questionContentID,
      required final List<String> choiceItems,
      required final String answer,
      required final String questionType,
      required final String classLevelLesson}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  String get id;
  @override
  String get questionContentID;
  @override //"content's id"
  List<String> get choiceItems;
  @override
  String get answer;
  @override
  String get questionType;
  @override
  String get classLevelLesson;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
