library json_parser;

import 'dart:convert';

import 'package:flutter/cupertino.dart';

abstract class JsonParser<T> {
  const JsonParser();

  Future<T?> parseFromJson(Map<String, dynamic> json);
}

mixin ObjectDecoder<T> on JsonParser<T> {
  Map<String, dynamic> decodeJsonObject(Map<String, dynamic> json) {
    /* Map<String, dynamic> decodedJson = {};
    try {
      decodedJson = jsonDecode(json) as Map<String, dynamic>;
    } catch (e) {
      debugPrint("ERROR DecodeJson: $e");
    } */
    return json;
  }
}

mixin ListDecoder<T> on JsonParser<T> {
  List<dynamic> decodeJsonList(String json) =>
      jsonDecode(json) as List<dynamic>;
}
