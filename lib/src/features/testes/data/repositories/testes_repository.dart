
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/question_model.dart';
import '../../domain/models/student_answer_model.dart';
import '../../domain/models/teste_model.dart';
import '../../domain/models/teste_report_model.dart';

abstract class TestesRepository {


  Future<Result<List<TesteModel>>> getListTestes(int studentId);
  Future<Result<TesteReportModel>> getTesteReport({
    required int studentId,
  });
  Future<Result<TesteModel>> getItemTeste(int id);
  Future<Result<TesteModel>> putTeste({
    required int id,
    required Map<String, dynamic> json,
  });

  Future<Result<List<QuestionModel>>> getListQuestions(int examId);
  Future<Result<TesteModel>> postStudentAnswers({
    required int studentId,
    required int testeId,
    required Map<int, int> selectedAnswers,
  });
  Future<Result<List<StudentAnswerModel>>> getListStudentAnswers({
    required int studentId,
    required int testeId,
  });

  Future<Result<TesteModel>> postTeste({
    required int studentId,
    required int testeId,
  });

  Future<Result<List<QuestionModel>>> startTeste(int testeId);
}
