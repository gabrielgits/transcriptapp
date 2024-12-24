import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/student_model.dart';
import '../../domain/models/student_score_model.dart';

abstract class AuthRepository {
  Future<Result<StudentModel>> signinWithPhone({
    required String phone,
    required String password,
  });

  Future<Result<StudentModel>> signup(StudentModel student);

  Future<Result<String>> forgotPassword(String phone);

  Future<Result<String>> updatePassword({
    required String oldPassword,
    required String newPassword,
    required int studentId,
  });
  Future<Result<String>> logout();

  Future<Result<StudentModel>> profile(int id);
  Future<Result<StudentModel>> updateProfile(StudentModel student);

  Future<Result<StudentScoreModel>> getStudentScore(int studentId);
}
