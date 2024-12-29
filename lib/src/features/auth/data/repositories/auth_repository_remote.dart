import 'package:transcriptapp/src/core/constants.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/student_model.dart';
import '../../domain/models/student_score_model.dart';
import '../services/auth_api_services.dart';
import '../services/auth_cache_services.dart';
import 'auth_repository.dart';

class AuthRepositoryRemote implements AuthRepository {
  final AuthApiServices _authApiServices;
  final AuthCacheServices _authCacheServices;

  AuthRepositoryRemote({
    required AuthApiServices authApiServices,
    required AuthCacheServices authCacheServices,
  }) : _authCacheServices = authCacheServices, _authApiServices = authApiServices;

  @override
  Future<Result<StudentModel>> signinWithPhone({
    required String phone,
    required String password,
  }) async {
    try {
      final data = await _authApiServices.signinWithPhone(
        phone: phone,
        password: password,
      );
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }

      final student = StudentModel.fromJson(data['data']['student']);
      final String token = data['data']['token'];
      final savedConfig = await _authCacheServices.updateLoginConfig(
        studentId: student.id,
        token: token,
        name: student.name,
      );
      if (!savedConfig) {
        return Result.error(Exception('Failed to save item'));
      }
      AppConstants.updatedUserToken = token;
      return Result.ok(student);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> forgotPassword(String phone) async {
    try {
      final data = await _authApiServices.forgotPassword(phone);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(data['message']);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> updatePassword({
    required String oldPassword,
    required String newPassword,
    required int studentId,
  }) async {
    try {
      final data = await _authApiServices.updatePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        studentId: studentId,
      );
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(data['message']);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> logout() async {
    try {
      final data = await _authApiServices.logout();
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      final savedConfig = await _authCacheServices.logout();
      if (!savedConfig) {
        return Result.error(Exception('Failed to clear config'));
      }
      AppConstants.updatedUserToken = '';
      return Result.ok(data['message']);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<StudentModel>> signup(StudentModel newStudent) async {
    try {
      final data = await _authApiServices.signup(newStudent.toJson());
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }

      final student = StudentModel.fromJson(data['data']['student']);
      final String token = data['data']['token'];
      final savedConfig = await _authCacheServices.updateLoginConfig(
        studentId: student.id,
        token: token,
        name: student.name,
      );
      if (!savedConfig) {
        return Result.error(Exception('Failed to save item'));
      }
      AppConstants.updatedUserToken = token;
      return Result.ok(student);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<StudentModel>> profile(int id) async {
    try {
      final data = await _authApiServices.profile(id);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(StudentModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<StudentModel>> updateProfile(StudentModel student) async {
    try {
      final data = await _authApiServices.updateProfile(student.toJson());
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(StudentModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<StudentScoreModel>> getStudentScore(int id) async {
    try {
      final data = await _authApiServices.getStudentScore(id);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(StudentScoreModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
