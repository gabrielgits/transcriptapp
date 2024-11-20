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
      final questions = await repositoryRemote.getListQuestions(examId);
      if (questions.isEmpty) {
        return (
          questions: List<QuestionModel>.empty(),
          exptWeb: ExptWebGet('Empty questions list', 1),
        );
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
      final answers = await repositoryRemote.getListStudentAnswers(studentId: studentId, testeId: testeId);
      if (answers.isEmpty) {
        return (
          answers: List<StudentAnswerModel>.empty(),
          exptWeb: ExptWebGet('Empty answers list', 1),
        );
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

  Future<({ExptWeb exptWeb, bool result})> sendStudentAnswer(
      StudentAnswerModel answer) async {
    try {
      final result = await repositoryRemote.postStudentAnswer(answer);
      if (result == false) {
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
      final teste = await repositoryRemote.postTeste(studentId: studentId, examId: examId);
      if (teste.id == 0) {
        return (
          teste: TesteModel.init(),
          exptWeb: ExptWebPost('Teste not started', 1),
        );
      }

      return (teste: teste, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        teste: TesteModel.init(),
        exptWeb: ExptWebUnknown('Error on start teste: ${e.toString()}', 3),
      );
    }
  }
}
