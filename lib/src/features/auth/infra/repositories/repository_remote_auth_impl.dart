import 'package:feds/feds.dart';
import 'package:transcriptapp/src/core/constants.dart';
import '../../domain/repositories/repository_remote_auth.dart';

class RepositoryRemoteAuthImpl implements RepositoryRemoteAuth {
  final FedsRest datasource;
  const RepositoryRemoteAuthImpl(this.datasource);

  @override
  Future<Map<String, dynamic>> signinWithPhone({
    required String phone,
    required String password,
  }) async {
    return await datasource.post(
      url: '${AppConstants.urlApi}/login',
      body: {'phone': phone, 'password': password},
    );
  }

  @override
  Future<Map<String, dynamic>> forgotPassword(String phone) async {
    return await datasource.post(
      url: '${AppConstants.urlApi}/forgot-password',
      body: {'phone': phone},
    );
  }

  @override
  Future<Map<String, dynamic>> updatePassword({
    required String oldPassword,
    required String newPassword,
    required int studentId,
  }) async {
    return await datasource.put(
      url: '${AppConstants.urlApi}/updatepassword',
      body: {'studentId': studentId, 'oldPassword': oldPassword, 'newPassword': newPassword},
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> logout() async {
    return await datasource.delete(
      '${AppConstants.urlApi}/logout',
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> signUp(Map<String, dynamic> json) async {
    return await datasource.post(
      url: '${AppConstants.urlApi}/signup',
      body: json,
    );
  }

  @override
  Future<Map<String, dynamic>> profile(int id) async {
    return await datasource.get(
      '${AppConstants.urlApi}/students/$id',
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> updateProfile(
      {required int id, required Map<String, dynamic> json}) async {
    return await datasource.put(
      url: '${AppConstants.urlApi}/update-profile',
      body: json,
      token: AppConstants.token,
    );
  }

    @override
  Future<Map<String, dynamic>> getStudentScore(int id) async {
    return await datasource.get(
      '${AppConstants.urlApi}/students/$id/score',
      token: AppConstants.token,
    );
  }
}
