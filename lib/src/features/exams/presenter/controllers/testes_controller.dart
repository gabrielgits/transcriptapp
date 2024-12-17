import 'package:expt/expt.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/core/dependency.dart';
import 'package:transcriptapp/src/features/exams/domain/models/question_model.dart';
import 'package:transcriptapp/src/features/home/presenter/controllers/controller_configs.dart';

import '../../domain/models/teste_model.dart';
import '../../domain/usecases/usecase_play_teste.dart';
import '../../domain/usecases/usecase_testes.dart';

part 'testes_controller.g.dart';

@riverpod
Future<List<TesteModel>> getAllTestes(Ref ref) async {
  final usecaseExams = getIt<UsecaseTestes>();
  final studentId = ref.watch(controllerConfigsProvider).value!.studentId;
  final result = await usecaseExams.fetchTestes(studentId);
  return result.testes;
}

@riverpod
Future<Map<String, dynamic>> getReportTestes(Ref ref) async {
  final usecaseExams = getIt<UsecaseTestes>();
  final studentId = ref.watch(controllerConfigsProvider).value!.studentId;
  final result = await usecaseExams.fetchReportTestes(studentId);
  return result.testeReport;
}

@riverpod
Future<List<QuestionModel>> startTeste(Ref ref, int testeId) async {
  final usecasePlayTeste = getIt<UsecasePlayTeste>();
  final studentId = ref.watch(controllerConfigsProvider).value!.studentId;
  final result =
      await usecasePlayTeste.startTeste(studentId: studentId, testeId: testeId);
  if (result.exptWeb != ExptWebNoExpt()) {
    throw Exception(result.exptWeb.message);
  }
  return result.questions;
}

@riverpod
class TestesController extends _$TestesController {
  @override
  Future<void> build() async {}

  Future<void> sendStudentAnswers({
    required Map<int, int> selectedAnswers,
    required int testeId,
  }) async {
    final usecasePlayTeste = getIt<UsecasePlayTeste>();
    final studentId = ref.watch(controllerConfigsProvider).value!.studentId;
    final result = await usecasePlayTeste.sendStudentAnswers(
      studentId: studentId,
      selectedAnswers: selectedAnswers,
      testeId: testeId,
    );
    if (result.exptWeb != ExptWebNoExpt()) {
      throw Exception(result.exptWeb.message);
    }
  }
}
