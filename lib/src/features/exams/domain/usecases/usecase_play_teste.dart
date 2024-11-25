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

  Future<({List<StudentAnswerModel> answers, ExptWeb exptWeb})> fetchListStudentAnswers({
    required int studentId,
    required int testeId
  }) async {
    try {
      final resultWeb = await repositoryRemote.getListStudentAnswers(studentId: studentId, testeId: testeId);
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

  Future<({ExptWeb exptWeb, bool result})> sendStudentAnswer({
    required int studentId,
    required int questionId,
    required int answerId,
    required int testeId,
  }) async {
    try {
      final answer = {
        'studentId': studentId,
        'questionId': questionId,
        'answerId': answerId,
        'testeId': testeId
      };
      final resultWeb = await repositoryRemote.postStudentAnswer(answer);
      if (resultWeb['status'] == false) {
        return (exptWeb: ExptWebPost('Answer not send', 1), result: false);
      }

      return (exptWeb: ExptWebNoExpt(), result: true);
    } catch (e) {
      return (
        exptWeb: ExptWebUnknown('Error on send answer: ${e.toString()}', 3),
        result: false
      );
    }
  }

    Future<({TesteModel teste, ExptWeb exptWeb})> startTeste({required int studentId, required int examId}) async {
    try {
      final resultWeb = await repositoryRemote.postTeste(studentId: studentId, examId: examId);
      if (resultWeb['status'] == false) {
        return (
          teste: TesteModel.init(),
          exptWeb: ExptWebPost('Teste not started: ${resultWeb["message"]}', 1),
        );
      }
      TesteModel teste = TesteModel.fromJson(resultWeb['data']);

      return (teste: teste, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        teste: TesteModel.init(),
        exptWeb: ExptWebUnknown('Error on start teste: ${e.toString()}', 3),
      );
    }
  }
}
