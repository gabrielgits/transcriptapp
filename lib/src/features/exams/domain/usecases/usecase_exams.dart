import 'package:expt/expt.dart';

import '../models/exam_model.dart';
import '../repositories/repository_remote_exams.dart';

class UsecaseExams {
  final RepositoryRemoteExams repositoryRemote;

  UsecaseExams(this.repositoryRemote);

  Future<({List<ExamModel> exams, ExptWeb exptWeb})> fetchExams(
      int studentId) async {
    try {
      final resultWeb = await repositoryRemote.getListExams(studentId);
      if (resultWeb['status'] == false) {
        return (
          exams: List<ExamModel>.empty(),
          exptWeb: ExptWebGet(
              'Problem to get exams list: ${resultWeb["message"]}', 1),
        );
      }
      List<ExamModel> exams = [];
      for (var examJson in resultWeb['data']) {
        exams.add(ExamModel.fromJson(examJson));
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
      final resultWeb = await repositoryRemote.getItemExam(id);
      if (resultWeb['status'] == false){
        return (
          exam: ExamModel.init(),
          exptWeb: ExptWebGet(
              'Problem to get exam: ${resultWeb["message"]}', 1),
        );
      }
      return (exam: ExamModel.fromJson(resultWeb['data']), exptWeb: ExptWebNoExpt());
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
      final resultWeb = await repositoryRemote.putExam(id: id, json: newExam.toJson());
            if (resultWeb['status'] == false){
        return (
          exam: ExamModel.init(),
          exptWeb: ExptWebPost(
              'Exam not updated: ${resultWeb["message"]}', 1),
        );
      }


      return (exam: ExamModel.fromJson(resultWeb['data']), exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        exam: ExamModel.init(),
        exptWeb: ExptWebUnknown('Error on update exam: ${e.toString()}', 3),
      );
    }
  }
}
