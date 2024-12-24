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
      final response = await dio.get(url);
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

    final response = await dio.post(
      url,
      data: body,
      options: Options(headers: _httpHeadersPost),
    );
    return response.data;
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
      final response = await dio.put(
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
      final response = await dio.delete(url);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

/*
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
*/
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

  Future<Map<String, dynamic>> logout() async {
    return await _delete('${AppConstants.urlApi}/logout');
  }

  Future<Map<String, dynamic>> signup(Map<String, dynamic> json) async {
    return await _post(
      url: '${AppConstants.urlApi}/signup',
      body: json,
    );
  }

  Future<Map<String, dynamic>> profile(int id) async {
    return await _get('${AppConstants.urlApi}/profile');
  }

  Future<Map<String, dynamic>> updateProfile(Map<String, dynamic> json) async {
    return await _put(
      url: '${AppConstants.urlApi}/students/${json['id']}',
      body: json,
    );
  }

  Future<Map<String, dynamic>> getStudentScore(int id) async {
    return await _get('${AppConstants.urlApi}/students/$id/score');
  }

  Future<Map<String, dynamic>> getAttendances(int id) {
    return _get('${AppConstants.urlApi}/attendances/student/$id/all');
  }

  Future<Map<String, dynamic>> getAttendanceReport(int id) {
    return _get('${AppConstants.urlApi}/attendances/student/$id');
  }

  Future<Map<String, dynamic>> getDailypoints(int id) async {
    return await _get('${AppConstants.urlApi}/dailypoints/student/$id/all');
  }

  Future<Map<String, dynamic>> getDailypointReport(int id) async {
    return await _get('${AppConstants.urlApi}/dailypoints/student/$id');
  }

  Future<Map<String, dynamic>> getTeste(int id) async {
    return await _get('${AppConstants.urlApi}/testes/$id');
  }

  Future<Map<String, dynamic>> getQuestions(int examId) async {
    return await _get('${AppConstants.urlApi}/questions/exam/$examId');
  }

  Future<Map<String, dynamic>> getStudentAnswers(
      {required int studentId, required int testeId}) async {
    return await _get(
        '${AppConstants.urlApi}/studentsanswers/student/$studentId/teste/$testeId');
  }

  Future<Map<String, dynamic>> getTestes(int studentId) async {
    return await _get('${AppConstants.urlApi}/testes/student/$studentId');
  }

  Future<Map<String, dynamic>> postStudentAnswers({
    required int studentId,
    required int testeId,
    required Map<String, int> selectedAnswers,
  }) async {
    return await _post(
      url: '${AppConstants.urlApi}/studentsanswers',
      body: {
        'studentId': studentId,
        'testeId': testeId,
        'selectedAnswers': selectedAnswers
      },
    );
  }

  Future<Map<String, dynamic>> postTeste(
      {required int studentId, required int testeId}) async {
    return await _post(
      url: '${AppConstants.urlApi}/testes',
      body: {'studentId': studentId, 'testeId': testeId},
    );
  }

  Future<Map<String, dynamic>> putTeste(
      {required int id, required Map<String, dynamic> json}) async {
    return await _put(
      url: '${AppConstants.urlApi}/testes/$id',
      body: json,
    );
  }

  Future<Map<String, dynamic>> getTesteReport(
      {required int studentId, required int limit}) async {
    return await _get(
      '${AppConstants.urlApi}/testes/student/$studentId/limit/$limit',
    );
  }

  Future<Map<String, dynamic>> startTeste(int testeId) {
    return _get('${AppConstants.urlApi}/testes/start/$testeId');
  }

  Future<Map<String, dynamic>> getNotifications() async {
    return await _get('${AppConstants.urlApi}/notifications');
  }

  Future<Map<String, dynamic>> getNotification(int id) async {
    return await _get('${AppConstants.urlApi}/notifications/$id');
  }

  Future<Map<String, dynamic>> postNotification(
      Map<String, dynamic> json) async {
    return await _post(
      url: '${AppConstants.urlApi}/notifications',
      body: json,
    );
  }

  Future<Map<String, dynamic>> putNotification(
      {required int id, required Map<String, dynamic> json}) async {
    return await _put(
      url: '${AppConstants.urlApi}/notifications/$id',
      body: json,
    );
  }

  Future<Map<String, dynamic>> deleteNotification(int id) async {
    return await _delete('${AppConstants.urlApi}/notifications/$id');
  }
}
