import 'package:feds/feds.dart';
import 'package:transcriptapp/src/core/constants.dart';

import '../../domain/repositories/repository_remote_exams.dart';

class RepositoryRemoteExamsImpl implements RepositoryRemoteExams {
  final FedsRest datasource;
  const RepositoryRemoteExamsImpl(this.datasource);

  @override
  Future<Map<String, dynamic>> getItemTeste(int id) async {
    return await datasource.get(
      '${AppConstants.urlApi}/testes/$id',
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> getListExams(int courseId) async {
    return await datasource.get(
      '${AppConstants.urlApi}/courses/$courseId/exams',
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> getListQuestions(int examId) async {
    return await datasource.get(
      '${AppConstants.urlApi}/exams/$examId/questions',
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> getListStudentAnswers({
    required int studentId,
    required int testeId,
  }) async {
    return await datasource.get(
      '${AppConstants.urlApi}/studentsanswers/student/$studentId/teste/$testeId',
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> getListTestes(int studentId) async {
    return await datasource.get(
      '${AppConstants.urlApi}/testes/student/$studentId',
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> postStudentAnswers({
    required int studentId,
    required int testeId,
    required Map<String, dynamic> selectedAnswers,
  }) async {
    return await datasource.post(
      url: '${AppConstants.urlApi}/studentsanswers',
      body: {
        'studentId': studentId,
        'testeId': testeId,
        'answers': selectedAnswers
      },
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> postTeste({
    required int studentId,
    required int testeId,
  }) async {
    return await datasource.post(
      url: '${AppConstants.urlApi}/testes',
      body: {'studentId': studentId, 'testeId': testeId},
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> putExam({
    required int id,
    required Map<String, dynamic> json,
  }) async {
    return await datasource.put(
      url: '${AppConstants.urlApi}/exams/$id',
      body: json,
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> putTeste({
    required int id,
    required Map<String, dynamic> json,
  }) async {
    return await datasource.put(
      url: '${AppConstants.urlApi}/testes/$id',
      body: json,
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> getItemExam(int id) async {
    return await datasource.get(
      '${AppConstants.urlApi}/exams/$id',
      token: AppConstants.token,
    );
  }

  @override
  Future<Map<String, dynamic>> getTesteReport(
      {required int studentId, required int limit}) {
    return datasource.get(
      '${AppConstants.urlApi}/testes/student/$studentId/limit/$limit',
      token: AppConstants.token,
    );
  }
}
