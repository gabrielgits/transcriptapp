//import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:transcriptapp/src/core/constants.dart';

class DioDatasource {
  final Dio _dio = Dio();

  String get token => AppConstants.updatedUserToken;

  final _httpHeadersPost = {
    //HttpHeaders.contentTypeHeader: "application/json",
    "Connection": "Keep-Alive",
    "Accept": "application/json",
    "Content-Type": "application/json", //"application/x-www-form-urlencoded"
  };
/*
  Map<String, String> _httpHeadersGet = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
*/

  Future<Map<String, dynamic>> get(String url) async {
    _dio.options.responseType = ResponseType.json;
    if (token.isNotEmpty) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    try {
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    _dio.options.responseType = ResponseType.json;
    if (token.isNotEmpty) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }

    final response = await _dio.post(
      url,
      data: body,
      options: Options(headers: _httpHeadersPost),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    _dio.options.responseType = ResponseType.json;
    if (token.isNotEmpty) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    try {
      final response = await _dio.put(
        url,
        data: body,
        options: Options(headers: _httpHeadersPost),
        // body: json.encode(body),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(String url) async {
    _dio.options.responseType = ResponseType.json;
    if (token.isNotEmpty) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    try {
      final response = await _dio.delete(url);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<int>> getData(String url) async {
    try {
      if (token.isNotEmpty) {
        _dio.options.headers["Authorization"] = "Bearer $token";
      }
      final response = await _dio.get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
        ),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
