import 'package:expt/expt.dart';

import '../models/exam_model.dart';
import '../repositories/repository_remote_exams.dart';

class UsecaseExams {
  final RepositoryRemoteExams repositoryRemote;

  UsecaseExams(this.repositoryRemote);

  Future<({List<ExamModel> exams, ExptWeb exptWeb})> fetchExams(
      int studentId) async {
    try {
      final exams = await repositoryRemote.getListExams(studentId);
      if (exams.isEmpty) {
        return (
          exams: List<ExamModel>.empty(),
          exptWeb: ExptWebPost('Empty exams list', 1),
        );
      }

      return (exams: exams, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        exams: List<ExamModel>.empty(),
        exptWeb: ExptWebUnknown('Error on get exams: ${e.toString()}', 3),
      );
    }
  }

  Future<({ExamModel exam, ExptWeb exptWeb})> fetchExamDetails(int id) async {
    try {
      final exam = await repositoryRemote.getItemExam(id);
      if (exam.id == 0) {
        return (
          exam: ExamModel.init(),
          exptWeb: ExptWebPost('Exam not found', 1),
        );
      }

      return (exam: exam, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        exam: ExamModel.init(),
        exptWeb: ExptWebUnknown('Error on get exam: ${e.toString()}', 3),
      );
    }
  }

  Future<({ExamModel exam, ExptWeb exptWeb})> updateExam({
    required int id,
    required ExamModel newExam,
  }) async {
    try {
      final exam = await repositoryRemote.putExam(id: id, newExam: newExam);
      if (exam.id == 0) {
        return (
          exam: ExamModel.init(),
          exptWeb: ExptWebPost('Exam not updated', 1),
        );
      }

      return (exam: exam, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        exam: ExamModel.init(),
        exptWeb: ExptWebUnknown('Error on update exam: ${e.toString()}', 3),
      );
    }
  }

}
