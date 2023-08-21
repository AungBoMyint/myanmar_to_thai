import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide FormData;
import 'package:hive/hive.dart';

import '../../core/constant/constant.dart';
import '../../core/other/loading.dart';
import '../../model/api/parser/json_parser.dart';

class RequestREST {
  final String? endPoint;
  final Map<String, dynamic> data;
  final Map<String, dynamic> queryParameter;
  RequestREST({
    this.endPoint,
    this.data = const {},
    this.queryParameter = const {},
  });

  final _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 10),
      /*headers: <String, String>{
          "user": "demo",
          "pass": "demo",
        }*/
    ),
  );

  Future<T?> executeGet<T>(JsonParser<T> parser) async {
    try {
      final response = await _dio.get<dynamic>(endPoint ?? "",
          queryParameters: queryParameter,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "Access-Control-Allow-Origin": "*",
              "Access-Control-Allow-Methods": "GET, HEAD, OPTIONS",
            },
          ));
      /* log("===Response: $response"); */
      if (response.statusCode == 200) {
        return parser.parseFromJson(response.data ?? "");
      }
      return null;
    } on DioException catch (e) {
      errorSnap("$e");
    }
    return null;
  }

  /*  Future<T?> executePost<T>(JsonParser<T> parser,
      {required String jwtToken}) async {
/*     _dio.interceptors.add(RetryInterceptor(dio: _dio));
 */
    showLoading(Get.context!);
    await Future.delayed(Duration.zero);
    try {
      final response = await _dio.post(endPoint ?? "",
          data: data,
          queryParameters: queryParameter,
          options: Options(
            headers: {
              "x-auth-token": jwtToken,
              "Content-Type": "application/json",
              "Access-Control-Allow-Origin": "*",
              "Access-Control-Allow-Methods": "GET, HEAD, POST, OPTIONS",
            },
          ));
      debugPrint("****Response: ${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("****Response: ${response.data}");
        hideLoading(Get.context!);
        return parser.parseFromJson(response.data ?? "");
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        errorSnap("${e.response?.data}");
      }
      hideLoading(Get.context!);
      if (e == DioExceptionType.connectionTimeout) {
        errorSnap("Connection Timeout,please try again!");
      } else {
        errorSnap("${e.response}");
      }
      debugPrint("****error $e");
    }
    return null;
  }
 */
  ///Login
  Future<T?> login<T>(JsonParser<T> parser, {required String jwtToken}) async {
    showLoading();
    try {
      final response = await _dio.post(endPoint ?? "",
          data: data,
          queryParameters: queryParameter,
          options: Options(
            headers: {
              /* "x-auth-token": jwtToken, */
              "Content-Type": "application/json",
              "Access-Control-Allow-Origin": "*",
/*               "Access-Control-Allow-Headers": "Content-Type",
 */
              "Access-Control-Allow-Credentials": true,
              "Access-Control-Allow-Headers": '*',
              "Referrer-Policy": "no-referrer-when-downgrade",
            },
          ));
      debugPrint("****Response: ${response.statusCode}");
      if (response.statusCode == 200) {
        log("Response headers: ${response.headers}");
        /*  if (response.headers["x-auth-token"]?.isNotEmpty == true) {
          box.put(jwtTokenKey, response.headers["x-auth-token"]);
          log("X Auth Token: ${box.get(jwtTokenKey)}");
        } */
        debugPrint("****Response: ${response.data}");
        hideLoading();
        return parser.parseFromJson(response.data ?? "");
      }

      // ignore: deprecated_member_use
    } on DioError catch (e) {
      hideLoading();
      log("============${e.response}");
      if (e.type == DioExceptionType.connectionTimeout) {
        errorSnap("Connection Timeout,please try again!");
      } else {
        errorSnap("${e.response}");
      }
      debugPrint("****Login error $e");
    }
    return null;
  }

/*   ///Update
  Future<T?> executePut<T>(JsonParser<T> parser,
      {required String jwtToken}) async {
/*     _dio.interceptors.add(RetryInterceptor(dio: _dio));
 */
    showLoading(Get.context!);
    try {
      final response = await _dio.put(endPoint ?? "",
          data: data,
          queryParameters: queryParameter,
          options: Options(
            headers: {
              "x-auth-token": jwtToken,
              "Content-Type": "application/json",
              "Access-Control-Allow-Origin": "*",
              "Access-Control-Allow-Methods": "GET, HEAD, POST, OPTIONS",
            },
          ));
      debugPrint("****Response: ${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("****Response: ${response.data}");
        hideLoading(Get.context!);
        return parser.parseFromJson(response.data ?? "");
      }
    } on DioError catch (e) {
      hideLoading(Get.context!);
      errorSnap("${e.response}");
      debugPrint("****Login error $e");
    }
    return null;
  }
 */
  ///Delete
/*   Future<dynamic> executeDelete<bool>({required String jwtToken}) async {
/*     _dio.interceptors.add(RetryInterceptor(dio: _dio));
 */
    showLoading(Get.context!);
    try {
      final response = await _dio.delete(endPoint ?? "",
          options: Options(
            headers: {
              "x-auth-token": jwtToken,
              "Content-Type": "application/json",
              "Access-Control-Allow-Origin": "*",
              "Access-Control-Allow-Methods": "GET, HEAD, POST, OPTIONS",
            },
          ));
      debugPrint("****Response: ${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("****Response: ${response.data}");
        hideLoading(Get.context!);
        return response.data;
      }
    } on DioError catch (e) {
      hideLoading(Get.context!);
      errorSnap("${e.response}");
      debugPrint("****Login error $e");
    }
    return null;
  }
 */
  //Delete All
/*   Future<dynamic> executeDeleteAll<bool>({required String jwtToken}) async {
    try {
      final response = await _dio.delete(endPoint ?? "",
          options: Options(
            headers: {
              "x-auth-token": jwtToken,
              "Content-Type": "application/json",
              "Access-Control-Allow-Origin": "*",
              "Access-Control-Allow-Methods": "GET, HEAD, POST, OPTIONS",
            },
          ));
      debugPrint("****Response: ${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("****Response: ${response.data}");
        return response.data;
      }
    } on DioError catch (e) {
      if (Get.isDialogOpen == false) {
        errorSnap("${e.response}");
      }
      debugPrint("****Login error $e");
    }
    return null;
  }
 */
}
