import 'package:transcriptapp/src/shared/data/services/dio_client_service.dart';
import 'package:transcriptapp/src/shared/data/services/sharedpref_service.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/student_model.dart';
import '../../domain/models/student_score_model.dart';
import 'auth_repository.dart';

class AuthRepositoryRemote implements AuthRepository {
  final DioClientService dioClientService;
  final SharedPrefService sharedPrefService;

  AuthRepositoryRemote({
    required this.dioClientService,
    required this.sharedPrefService,
  });

  @override
  Future<Result<StudentModel>> signinWithPhone({
    required String phone,
    required String password,
  }) async {
    try {
      final data = await dioClientService.signinWithPhone(
        phone: phone,
        password: password,
      );
      if (data['status'] == false) {
        return Result.error(data['message']);
      }

      final student = StudentModel.fromJson(data['data']['student']);
      final String token = data['data']['token'];
      final savedConfig = await sharedPrefService.updateLoginConfig(
        studentId: student.id,
        token: token,
      );
      if (!savedConfig) {
        return Result.error(Exception('Failed to save item'));
      }
      dioClientService.setToken(token);
      return Result.ok(student);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> forgotPassword(String phone) async {
    try {
      final data = await dioClientService.forgotPassword(phone);
      if (data['status'] == false) {
        return Result.error(data['message']);
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
      final data = await dioClientService.updatePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        studentId: studentId,
      );
      if (data['status'] == false) {
        return Result.error(data['message']);
      }
      return Result.ok(data['message']);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<String>> logout() async {
    try {
      final data = await dioClientService.logout();
      if (data['status'] == false) {
        return Result.error(data['message']);       
      }
      final savedConfig = await sharedPrefService.logout();
      if (!savedConfig) {
        return Result.error(Exception('Failed to clear config'));
      }
      dioClientService.setToken('');
      return Result.ok(data['message']);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
 Future<Result<StudentModel>> signup(StudentModel newStudent) async {
    try {
      final data = await dioClientService.signup(newStudent.toJson());
      if (data['status'] == false) {
        return Result.error(data['message']);
      }

      final student = StudentModel.fromJson(data['data']['student']);
      final String token = data['data']['token'];
      final savedConfig = await sharedPrefService.updateLoginConfig(
        studentId: student.id,
        token: token,
      );
      if (!savedConfig) {
        return Result.error(Exception('Failed to save item'));
      }
      dioClientService.setToken(token);
      return Result.ok(student);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<StudentModel>> profile(int id) async {
    try {
      final data = await dioClientService.profile(id);
      if (data['status'] == false) {
        return Result.error(data['message']);
      }
      return Result.ok(StudentModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
   Future<Result<StudentModel>> updateProfile(StudentModel student) async {
    try {
      final data = await dioClientService.updateProfile(student.toJson());
      if (data['status'] == false) {
        return Result.error(data['message']);
      }
      return Result.ok(StudentModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<StudentScoreModel>> getStudentScore(int id) async {
    try {
      final data = await dioClientService.getStudentScore(id);
      if (data['status'] == false) {
        return Result.error(data['message']);
      }
      return Result.ok(StudentScoreModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
