import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_scope.freezed.dart';
part 'class_scope.g.dart';

@freezed
class ClassScope with _$ClassScope {
  factory ClassScope({
    required String id,
    required String name,
  }) = _ClassScope;
  factory ClassScope.fromJson(Map<String, dynamic> json) =>
      _$ClassScopeFromJson(json);
}
