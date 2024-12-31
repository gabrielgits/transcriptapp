import 'package:transcriptapp/src/core/constants.dart';
import 'package:transcriptapp/src/shared/datasources/dio_datasource.dart';

class AuthApiServices {

  final DioDatasource _dioDatasorce;

  AuthApiServices(this._dioDatasorce);
  
  Future<Map<String, dynamic>> signinWithPhone({
    required String phone,
    required String password,
  }) async {
    return await _dioDatasorce.post(
      '${AppConstants.urlApi}/login',
      body: {'phone': phone, 'password': password},
    );
  }

  Future<Map<String, dynamic>> forgotPassword(String phone) async {
    return await _dioDatasorce.post(
      '${AppConstants.urlApi}/forgotpassword',
      body: {'phone': phone},
    );
  }

  Future<Map<String, dynamic>> updatePassword({
    required String oldPassword,
    required String newPassword,
    required int studentId,
  }) async {
    return await _dioDatasorce.put(
       '${AppConstants.urlApi}/updatepassword',
      body: {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
        'studentId': studentId
      },
    );
  }

  Future<Map<String, dynamic>> logout() async {
    return await _dioDatasorce.delete('${AppConstants.urlApi}/logout');
  }

  Future<Map<String, dynamic>> signup(Map<String, dynamic> json) async {
    return await _dioDatasorce.post(
      '${AppConstants.urlApi}/signup',
      body: json,
    );
  }

  Future<Map<String, dynamic>> profile(int id) async {
    return await _dioDatasorce.get('${AppConstants.urlApi}/profile');
  }

  Future<Map<String, dynamic>> updateProfile(Map<String, dynamic> json) async {
    return await _dioDatasorce.put(
      '${AppConstants.urlApi}/students/${json['id']}',
      body: json,
    );
  }

    Future<Map<String, dynamic>> getStudentScore(int id) async {
    return await _dioDatasorce.get('${AppConstants.urlApi}/students/$id/score');
  }

}