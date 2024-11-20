import 'package:fecs/fecs.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';
import 'package:transcriptapp/src/features/auth/domain/repositories/repository_remote_auth.dart';


class RepositoryRemoteAuthImpl implements RepositoryRemoteAuth {
  final FecsData datasource;
  const RepositoryRemoteAuthImpl(this.datasource);

  final table = 'students';

  Future<StudentModel> _saveStudent(Map<String, dynamic> data) async {
    if (data['status'] == false) {
      throw Exception(data['error']);
    }
    final responseCheck = await datasource.searchAll(
      table: table,
      field: 'phone',
      isEqualTo: data['data']['phone'],
    );

    if (responseCheck['status'] == false) {
      throw Exception(responseCheck['error']);
    }

    if (responseCheck['data'].isEmpty) {
      final responsePost =
          await datasource.post(table: table, body: data['data']);
      if (responsePost['status'] == false) {
        throw Exception(responsePost['error']);
      }
      final student = StudentModel.fromJson(data['data']);
      return student.copyWith(id: responsePost['data'].id);
    }

    return StudentModel.fromJson(responseCheck['data'].first);
  }

  @override
  Future<StudentModel> signinWithPhone({
    required String phone,
    required String password,
  }) async {
    final data = await datasource.signinWithEmail(
      email: phone,
      password: password,
    );
    return await _saveStudent(data);
  }

  @override
  Future<bool> forgotPassword(String email) async {
    return await datasource.recoveryPassword(email);
  }

  @override
  Future<bool> recoveryPassword({
    required String code,
    required String newPassword,
  }) async {
    return await datasource.confirmPasswordReset(
      code: code,
      newPassword: newPassword,
    );
  }

  @override
  Future<bool> updatePassword(String newPassword) async {
    return await datasource.changePassword(newPassword);
  }

  @override
  Future<bool> logout() async {
    return await datasource.logout();
  }
}
