import '../models/exam_model.dart';
import '../models/question_model.dart';
import '../models/student_answer_model.dart';
import '../models/teste_model.dart';

abstract class RepositoryRemoteExams {
  Future<List<ExamModel>> getListExams(int studentId);
  Future<ExamModel> getItemExam(int id);
  Future<ExamModel> putExam({required int id, required ExamModel newExam});

  Future<List<TesteModel>> getListTestes(int studentId);
  Future<TesteModel> getItemTeste(int id);
  Future<TesteModel> putTeste({required int id, required TesteModel newTeste});

    Future<List<QuestionModel>> getListQuestions(int examId);
  Future<bool> postStudentAnswer(StudentAnswerModel answer);
  Future<List<StudentAnswerModel>> getListStudentAnswers({
    required int studentId,
    required int testeId,
  });

  Future<TesteModel> postTeste({required int studentId, required int examId});
}
