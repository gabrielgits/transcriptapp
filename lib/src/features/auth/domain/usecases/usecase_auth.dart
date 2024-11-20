import 'package:expt/expt.dart';

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

  Future<({ExptData exptData, ExptWeb exptWeb})> logout(int id) async {
    try {
      final resultWeb = await repositoryRemote.logout();
      if (!resultWeb) {
        return (
          exptData: ExptDataNoExpt(),
          exptWeb: ExptWebPost('Logout failed', 1)
        );
      }

      final resultLocal = await repositoryLocal.deleteItem(id);
      if (resultLocal == 0) {
        return (
          exptData: ExptDataDelete('Item not deleted', 2),
          exptWeb: ExptWebNoExpt(),
        );
      }

      return (exptData: ExptDataNoExpt(), exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        exptData: ExptDataUnknown('Logout failed', 3),
        exptWeb: ExptWebUnknown('Logout failed', 3),
      );
    }
  }

  Future<({ExptData exception, int id})> updateStudentIdConfig(int id) async {
    try {
      final resultLocal = await repositoryLocal.updateStudentIdConfig(id);
      if (resultLocal == 0) {
        return (
          exception: ExptDataDelete('Item not saved', 1),
          id: 0,
        );
      }

      return (exception: ExptDataNoExpt(), id: resultLocal);
    } catch (e) {
      return (
        exception: ExptDataUnknown(e.toString(), 2),
        id: 0,
      );
    }
  }

  Future<ExptWeb> changePassword(newPassword) async {
    try {
      final result = await repositoryRemote.updatePassword(newPassword);
      if (result == false) {
        return ExptWebPost('Password not changed', 1);
      }
      return ExptWebNoExpt();
    } catch (e) {
      return ExptWebUnknown(e.toString(), 2);
    }
  }

  Future<ExptWeb> forgotPassword(String email) async {
    try {
      final result = await repositoryRemote.forgotPassword(email);
      if (result == false) {
        return ExptWebGet('Profile not found', 1);
      }
      return ExptWebNoExpt();
    } catch (e) {
      return ExptWebUnknown(e.toString(), 2);
    }
  }

  Future<({StudentModel student, ExptWeb exptWeb})> signinWithPhone(
      {required String phone, required String password}) async {
    try {
      final student = await repositoryRemote.signinWithPhone(
          phone: phone, password: password);
      int idSaved = await repositoryLocal.saveItem(student);
      if (idSaved < 1) {
        return (
          student: StudentModel.init(),
          exptWeb: ExptWebGet('Failed to save item', 1)
        );
      }
      return (student: student, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (student: StudentModel.init(), exptWeb: ExptWebUnknown(e.toString(), 1));
    }
  }


  Future<({ExptWeb exception, bool result})> recoveryPassword({
    required String code,
    required String newPassword,
  }) async {
    try {
      final result = await repositoryRemote.recoveryPassword(
        code: code,
        newPassword: newPassword,
      );
      if (result == false) {
        return (
          exception: ExptWebGet('Password not changed', 1),
          result: false
        );
      }
      return (exception: ExptWebNoExpt(), result: true);
    } catch (e) {
      return (exception: ExptWebUnknown(e.toString(), 1), result: false);
    }
  }

  /// Loads a single Student by its ID from the local repository.
  ///
  /// Returns a [Future] that completes with the [StudentModel] item.
  Future<({ExptData exception, StudentModel item})> loadStudent(int id) async {
    try {
      final item = await repositoryLocal.getItem(id);
      if (item.id > 0) {
        return (
          exception: ExptDataNoExpt(),
          item: item,
        );
      } else {
        return (
          exception: ExptDataLoad('Item not found', 1),
          item: StudentModel.init(),
        );
      }
    } catch (e) {
      return (
        exception: ExptDataLoad(e.toString(), 2),
        item: StudentModel.init(),
      );
    }
  }
}
