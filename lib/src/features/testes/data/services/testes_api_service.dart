import 'package:transcriptapp/src/core/constants.dart';
import 'package:transcriptapp/src/shared/datasources/dio_datasource.dart';

class TestesApiService {

  final DioDatasource _dioDatasource;

  TestesApiService(this._dioDatasource);

  Future<Map<String, dynamic>> getTeste(int id) async {
    return await _dioDatasource.get('${AppConstants.urlApi}/testes/$id');
  }

  Future<Map<String, dynamic>> getQuestions(int examId) async {
    return await _dioDatasource.get('${AppConstants.urlApi}/questions/exam/$examId');
  }

  Future<Map<String, dynamic>> getStudentAnswers(
      {required int studentId, required int testeId}) async {
    return await _dioDatasource.get(
        '${AppConstants.urlApi}/studentsanswers/student/$studentId/teste/$testeId');
  }

  Future<Map<String, dynamic>> getTestes(int studentId) async {
    return await _dioDatasource.get('${AppConstants.urlApi}/testes/student/$studentId');
  }

  Future<Map<String, dynamic>> postStudentAnswers({
    required int studentId,
    required int testeId,
    required Map<String, int> selectedAnswers,
  }) async {
    return await _dioDatasource.post(
      '${AppConstants.urlApi}/studentsanswers',
      body: {
        'studentId': studentId,
        'testeId': testeId,
        'selectedAnswers': selectedAnswers
      },
    );
  }

  Future<Map<String, dynamic>> postTeste(
      {required int studentId, required int testeId}) async {
    return await _dioDatasource.post(
      '${AppConstants.urlApi}/testes',
      body: {'studentId': studentId, 'testeId': testeId},
    );
  }

  Future<Map<String, dynamic>> putTeste(
      {required int id, required Map<String, dynamic> json}) async {
    return await _dioDatasource.put(
      '${AppConstants.urlApi}/testes/$id',
      body: json,
    );
  }

  Future<Map<String, dynamic>> getTesteReport(
      {required int studentId, required int limit}) async {
    return await _dioDatasource.get(
      '${AppConstants.urlApi}/testes/student/$studentId/limit/$limit',
    );
  }

  Future<Map<String, dynamic>> startTeste(int testeId) async {
    return await _dioDatasource.get('${AppConstants.urlApi}/testes/start/$testeId');
  }
}