import 'package:json_annotation/json_annotation.dart';
import 'class_scope.dart';

part 'class_scope_all.g.dart';

@JsonSerializable(explicitToJson: true)
class ClassScopeAll {
  final int count;
  final List<ClassScope> data;
  ClassScopeAll({required this.count, required this.data});

  factory ClassScopeAll.fromJson(Map<String, dynamic> json) =>
      _$ClassScopeAllFromJson(json);
  Map<String, dynamic> toJson() => _$ClassScopeAllToJson(this);
}
