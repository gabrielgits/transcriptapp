import '../models/student_model.dart';

abstract class RepositoryRemoteAuth {
  Future<StudentModel> signinWithPhone({
    required String phone,
    required String password,
  });

  Future<bool> forgotPassword(String email);
  Future<bool> recoveryPassword({
    required String code,
    required String newPassword,
  });
  Future<bool> updatePassword(String newPassword);
  Future<bool> logout();
}
