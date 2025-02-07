import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/question_model.dart';
import '../../domain/models/student_answer_model.dart';
import '../../domain/models/teste_model.dart';
import '../../domain/models/teste_report_model.dart';
import '../services/testes_api_service.dart';
import 'testes_repository.dart';

class TestesRepositoryRemote implements TestesRepository {
  final TestesApiService _testesApiService;
  const TestesRepositoryRemote(this._testesApiService);

  @override
  Future<Result<TesteModel>> getItemTeste(int id) async {
    try {
      final data = await _testesApiService.getTeste(id);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(TesteModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<QuestionModel>>> getListQuestions(int examId) async {
    try {
      final data = await _testesApiService.getQuestions(examId);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      List<QuestionModel> questions = [];
      for (final questionJson in data['data']) {
        questions.add(QuestionModel.fromJson(questionJson));
      }
      return Result.ok(questions);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<StudentAnswerModel>>> getListStudentAnswers({
    required int studentId,
    required int testeId,
  }) async {
    try {
      final data = await _testesApiService.getStudentAnswers(
        studentId: studentId,
        testeId: testeId,
      );
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      List<StudentAnswerModel> studentAnswers = [];
      for (final studentAnswerJson in data['data']) {
        studentAnswers.add(StudentAnswerModel.fromJson(studentAnswerJson));
      }
      return Result.ok(studentAnswers);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<TesteModel>>> getListTestes(int studentId) async {
    try {
      final data = await _testesApiService.getTestes(studentId);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      List<TesteModel> testes = [];
      for (final testeJson in data['data']) {
        testes.add(TesteModel.fromJson(testeJson));
      }
      return Result.ok(testes);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<TesteModel>> postStudentAnswers({
    required int studentId,
    required int testeId,
    required Map<int, int> selectedAnswers,
  }) async {
    try {
      final data = await _testesApiService.postStudentAnswers(
        studentId: studentId,
        testeId: testeId,
        selectedAnswers: selectedAnswers
            .map((key, value) => MapEntry(key.toString(), value)),
      );
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(TesteModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<TesteModel>> postTeste({
    required int studentId,
    required int testeId,
  }) async {
    try {
      final data = await _testesApiService.postTeste(
        studentId: studentId,
        testeId: testeId,
      );
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(TesteModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<TesteModel>> putTeste({
    required int id,
    required Map<String, dynamic> json,
  }) async {
    try {
      final data = await _testesApiService.putTeste(id: id, json: json);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(TesteModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<TesteReportModel>> getTesteReport(
      {required int studentId}) async {
    try {
      final data = await _testesApiService.getTesteReport(
        studentId: studentId,
        limit: 3,
      );
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(TesteReportModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<QuestionModel>>> startTeste(int testeId) async {
    try {
      final data = await _testesApiService.startTeste(testeId);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      List<QuestionModel> questions = [];
      for (final questionJson in data['data']) {
        questions.add(QuestionModel.fromJson(questionJson));
      }
      return Result.ok(questions);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
