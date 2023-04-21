import 'package:freezed_annotation/freezed_annotation.dart';

part 'content.freezed.dart';
part 'content.g.dart';

@freezed
class Content with _$Content {
  factory Content({
    required String id,
    required String myanmar,
    required String thai,
    String? image,
    required String audio,
    required String classLevelLesson, //classID-levelID-lessonID
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}
