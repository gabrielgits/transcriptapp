//import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:transcriptapp/src/core/constants.dart';

class DioClientService {
  final Dio dio = Dio();
  String _token = '';

  void setToken(String token) => _token = token;

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

  Future<Map<String, dynamic>> _get(String url) async {
    dio.options.responseType = ResponseType.json;
    if (_token.isNotEmpty) {
      dio.options.headers["Authorization"] = "Bearer $_token";
    }
    try {
      var response = await dio.get(url);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    dio.options.responseType = ResponseType.json;
    if (_token.isNotEmpty) {
      dio.options.headers["Authorization"] = "Bearer $_token";
    }
    try {
      var response = await dio.post(
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

  Future<Map<String, dynamic>> _put({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    dio.options.responseType = ResponseType.json;
    if (_token.isNotEmpty) {
      dio.options.headers["Authorization"] = "Bearer $_token";
    }
    try {
      var response = await dio.put(
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

  Future<Map<String, dynamic>> _delete(String url) async {
    dio.options.responseType = ResponseType.json;
    if (_token.isNotEmpty) {
      dio.options.headers["Authorization"] = "Bearer $_token";
    }
    try {
      var response = await dio.delete(url);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<int>> _getData(String url) async {
    try {
      if (_token.isNotEmpty) {
        dio.options.headers["Authorization"] = "Bearer $_token";
      }
      final response = await dio.get(
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

  Future<Map<String, dynamic>> signinWithPhone({
    required String phone,
    required String password,
  }) async {
    return await _post(
      url: '${AppConstants.urlApi}/login',
      body: {'phone': phone, 'password': password},
    );
  }

  Future<Map<String, dynamic>> forgotPassword(String phone) async {
    return await _post(
      url: '${AppConstants.urlApi}/forgotpassword',
      body: {'phone': phone},
    );
  }

  Future<Map<String, dynamic>> updatePassword({
    required String oldPassword,
    required String newPassword,
    required int studentId,
  }) async {
    return await _put(
      url: '${AppConstants.urlApi}/updatepassword',
      body: {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
        'studentId': studentId
      },
    );
  }

  Future<Map<String, dynamic>> logout() async{
    return await _delete('${AppConstants.urlApi}/logout');
  }

  Future<Map<String, dynamic>> signup(Map<String, dynamic> json) async {
    return await _post(
      url: '${AppConstants.urlApi}/signup',
      body: json,
    );
  }

  Future<Map<String, dynamic>> profile(int id) async {
    return await _get('${AppConstants.urlApi}/profile/$id');
  }

  Future<Map<String, dynamic>>  updateProfile(Map<String, dynamic> json) async {
    return await _put(
      url: '${AppConstants.urlApi}/students/${json['id']}',
      body: json,
    );
  }

  Future<Map<String, dynamic>> getStudentScore(int id) async {
    return await _get('${AppConstants.urlApi}/students/$id/score');
  }
}
