import 'package:expt/expt.dart';

import '../models/question_model.dart';
import '../models/student_answer_model.dart';
import '../models/teste_model.dart';
import '../repositories/repository_remote_exams.dart';

class UsecasePlayTeste {
  final RepositoryRemoteExams repositoryRemote;

  UsecasePlayTeste({required this.repositoryRemote});

  Future<({List<QuestionModel> questions, ExptWeb exptWeb})> fetchListQuestions(
      int examId) async {
    try {
      final resultWeb = await repositoryRemote.getListQuestions(examId);
      if (resultWeb['status'] == false) {
        return (
          questions: List<QuestionModel>.empty(),
          exptWeb: ExptWebGet(
              'Problem to get questions list: ${resultWeb["message"]}', 1),
        );
      }
      List<QuestionModel> questions = [];
      for (var questionJson in resultWeb['data']) {
        questions.add(QuestionModel.fromJson(questionJson));
      }
      return (
        questions: questions,
        exptWeb: ExptWebNoExpt(),
      );
    } catch (e) {
      return (
        questions: List<QuestionModel>.empty(),
        exptWeb: ExptWebUnknown('Error on get questions: ${e.toString()}', 3),
      );
    }
  }

  Future<({List<StudentAnswerModel> answers, ExptWeb exptWeb})>
      fetchListStudentAnswers(
          {required int studentId, required int testeId}) async {
    try {
      final resultWeb = await repositoryRemote.getListStudentAnswers(
          studentId: studentId, testeId: testeId);
      if (resultWeb['status'] == false) {
        return (
          answers: List<StudentAnswerModel>.empty(),
          exptWeb: ExptWebGet(
              'Problem to get answers list: ${resultWeb["message"]}', 1),
        );
      }
      List<StudentAnswerModel> answers = [];
      for (var answerJson in resultWeb['data']) {
        answers.add(StudentAnswerModel.fromJson(answerJson));
      }
      return (
        answers: answers,
        exptWeb: ExptWebNoExpt(),
      );
    } catch (e) {
      return (
        answers: List<StudentAnswerModel>.empty(),
        exptWeb: ExptWebUnknown('Error on get answers: ${e.toString()}', 3),
      );
    }
  }

  Future<({ExptWeb exptWeb, TesteModel teste})> sendStudentAnswers({
    required int studentId,
    required int testeId,
    required Map<int, int> selectedAnswers,
  }) async {
    try {
      Map<String, dynamic> answers = selectedAnswers.map((key, value) {
        return MapEntry(key.toString(), value);
      });
      final resultWeb = await repositoryRemote.postStudentAnswers(
        studentId: studentId,
        testeId: testeId,
        selectedAnswers: answers,
      );
      if (resultWeb['status'] == false) {
        return (exptWeb: ExptWebPost('Answer not send', 1), teste: TesteModel.init());
      }

      TesteModel teste = TesteModel.fromJson(resultWeb['data']);

      return (exptWeb: ExptWebNoExpt(), teste: teste);
    } catch (e) {
      return (
        exptWeb: ExptWebUnknown('Error on send answer: ${e.toString()}', 3),
        teste: TesteModel.init(),
      );
    }
  }

  Future<({List<QuestionModel> questions, ExptWeb exptWeb})> startTeste(
      {required int studentId, required int testeId}) async {
    try {
      final resultWeb = await repositoryRemote.postTeste(
          studentId: studentId, testeId: testeId);
      if (resultWeb['status'] == false) {
        return (
          questions: List<QuestionModel>.empty(),
          exptWeb: ExptWebPost('Teste not started: ${resultWeb["message"]}', 1),
        );
      }
      List<QuestionModel> questions = [];
      for (final testeJson in resultWeb['data']) {
        questions.add(QuestionModel.fromJson(testeJson));
      }

      return (questions: questions, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        questions: List<QuestionModel>.empty(),
        exptWeb: ExptWebUnknown('Error on start teste: ${e.toString()}', 3),
      );
    }
  }
}
