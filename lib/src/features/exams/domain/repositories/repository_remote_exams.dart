abstract class RepositoryRemoteExams {
  Future<Map<String, dynamic>> getListExams(int studentId);
  Future<Map<String, dynamic>> getItemExam(int id);
  Future<Map<String, dynamic>> putExam({
    required int id,
    required Map<String, dynamic> json,
  });

  Future<Map<String, dynamic>> getListTestes(int studentId);
  Future<Map<String, dynamic>> getTesteReport({
    required int studentId,
    required int limit,
  });
  Future<Map<String, dynamic>> getItemTeste(int id);
  Future<Map<String, dynamic>> putTeste({
    required int id,
    required Map<String, dynamic> json,
  });

  Future<Map<String, dynamic>> getListQuestions(int examId);
  Future<Map<String, dynamic>> postStudentAnswers({
    required int studentId,
    required int testeId,
    required Map<String, dynamic> selectedAnswers,
  });
  Future<Map<String, dynamic>> getListStudentAnswers({
    required int studentId,
    required int testeId,
  });

  Future<Map<String, dynamic>> postTeste({
    required int studentId,
    required int testeId,
  });
}
