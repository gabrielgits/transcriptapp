import 'package:expt/expt.dart';
import 'package:transcriptapp/src/config/constants.dart';

import '../models/student_model.dart';
import '../repositories/repository_local_auth.dart';
import '../repositories/repository_remote_auth.dart';

class UsecaseAuth {
  final RepositoryRemoteAuth repositoryRemote;
  final RepositoryLocalAuth repositoryLocal;

  UsecaseAuth({
    required this.repositoryRemote,
    required this.repositoryLocal,
  });

  Future<({ExptData exptData, ExptWeb exptWeb})> logout() async {
    try {
      final resultWeb = await repositoryRemote.logout();
      if (resultWeb['status'] == false) {
        return (
          exptData: ExptDataNoExpt(),
          exptWeb: ExptWebPost("Logout failed: $resultWeb['message']", 1),
        );
      }

      final resultLocal = await repositoryLocal.deleteConfigStudent();
      if (resultLocal == 0) {
        return (
          exptData: ExptDataDelete('Item not deleted', 2),
          exptWeb: ExptWebNoExpt(),
        );
      }

      return (exptData: ExptDataNoExpt(), exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        exptData: ExptDataUnknown('Logout error: $e', 3),
        exptWeb: ExptWebUnknown('Logout error: $e', 3),
      );
    }
  }

  Future<ExptWeb> changePassword({
    required String oldPassword,
    required String newPassword,
    required int studentId,
  }) async {
    try {
      final resultWeb = await repositoryRemote.updatePassword(
        newPassword: newPassword,
        oldPassword: oldPassword,
        studentId: studentId,
      );

      if (resultWeb['status'] == false) {
        return ExptWebPost("Password not changed: ${resultWeb['message']}", 1);
      }

      return ExptWebNoExpt();
    } catch (e) {
      return ExptWebUnknown(e.toString(), 2);
    }
  }

  Future<ExptWeb> forgotPassword(String phone) async {
    try {
      final resultWeb = await repositoryRemote.forgotPassword(phone);
      if (resultWeb['status'] == false) {
        return ExptWebPost("Profile not found: ${resultWeb['message']}", 1);
      }
      return ExptWebNoExpt();
    } catch (e) {
      return ExptWebUnknown(e.toString(), 2);
    }
  }

  Future<({StudentModel student, ExptWeb exptWeb})> signinWithPhone(
      {required String phone, required String password}) async {
    try {
      final resultWeb = await repositoryRemote.signinWithPhone(
          phone: phone, password: password);

      if (resultWeb['status'] == false) {
        return (
          student: StudentModel.init(),
          exptWeb: ExptWebPost("Login failed: ${resultWeb['message']}", 1),
        );
      }
      final student = StudentModel.fromJson(resultWeb['data']['student']);
      final token = resultWeb['data']['token'];
      int idSaved = await repositoryLocal.updateConfigStudent(
        studentId: student.id,
        token: token,
      );
      if (idSaved < 1) {
        return (
          student: StudentModel.init(),
          exptWeb: ExptWebPost('Failed to save item', 1)
        );
      }
      AppConstants.token = token;
      return (student: student, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        student: StudentModel.init(),
        exptWeb: ExptWebUnknown(e.toString(), 1)
      );
    }
  }

  Future<({StudentModel student, ExptWeb exptWeb})> signUp({
    required String name,
    required String email,
    required String password,
    required int courseId,
  }) async {
    try {
      final json = {
        'name': name,
        'email': email,
        'password': password,
        'courseId': courseId,
      };
      final resultWeb = await repositoryRemote.signUp(json);

      if (resultWeb['status'] == false) {
        return (
          student: StudentModel.init(),
          exptWeb: ExptWebPost("Signup failed: ${resultWeb['message']}", 1),
        );
      }
      final student = StudentModel.fromJson(resultWeb['data']['student']);
      final token = resultWeb['data']['token'];
      int idSaved = await repositoryLocal.updateConfigStudent(
        studentId: student.id,
        token: token,
      );
      if (idSaved < 1) {
        return (
          student: StudentModel.init(),
          exptWeb: ExptWebPost('Failed to save item', 1)
        );
      }
      AppConstants.token = token;
      return (student: student, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        student: StudentModel.init(),
        exptWeb: ExptWebUnknown(e.toString(), 1)
      );
    }
  }

  Future<({ExptWeb exception, StudentModel student})> profile(int id) async {
    try {
      final resultWeb = await repositoryRemote.profile(id);
      if (resultWeb['status'] == false) {
        return (
          exception:
              ExptWebGet("Profile not found: ${resultWeb['message']}", 1),
          student: StudentModel.init(),
        );
      }

      return (
        exception: ExptWebNoExpt(),
        student: StudentModel.fromJson(resultWeb['data']),
      );
    } catch (e) {
      return (
        exception: ExptWebUnknown(e.toString(), 2),
        student: StudentModel.init(),
      );
    }
  }

  Future<({Map<String, dynamic> scoreReport, ExptWeb exptWeb})>
      fetchStudentScore(int studentId) async {
    try {
      final resultWeb = await repositoryRemote.getStudentScore(studentId);
      if (resultWeb['status'] == false) {
        return (
          scoreReport: {
            'testesAverage': 0,
            'attendancesPercent': 0,
            'dailypointsAverageFinal': 0,
            'finalAverage': 0,
          },
          exptWeb: ExptWebGet(
              'Problem to get score Report: ${resultWeb["message"]}', 1),
        );
      }

      Map<String, dynamic> scoreReport = resultWeb['data'];

      return (scoreReport: scoreReport, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        scoreReport: {
          'testesAverage': 0,
          'attendancesPercent': 0,
          'dailypointsAverageFinal': 0,
          'finalAverage': 0,
        },
        exptWeb: ExptWebUnknown('Error on get testes: ${e.toString()}', 3),
      );
    }
  }
}
