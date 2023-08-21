import 'package:json_annotation/json_annotation.dart';

part 'class_scope.g.dart';

@JsonSerializable()
class ClassScope {
  @JsonKey(name: "_id")
  final String id;
  final String name;
  ClassScope({required this.id, required this.name});

  factory ClassScope.fromJson(Map<String, dynamic> json) =>
      _$ClassScopeFromJson(json);
  Map<String, dynamic> toJson() => _$ClassScopeToJson(this);
}
