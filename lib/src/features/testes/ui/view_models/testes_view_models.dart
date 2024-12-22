import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/core/dependency.dart';
import 'package:transcriptapp/src/features/config/ui/view_models/config_view_model.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../data/repositories/testes_repository.dart';
import '../../domain/models/question_model.dart';
import '../../domain/models/teste_model.dart';
import '../../domain/models/teste_report_model.dart';


part 'testes_view_models.g.dart';

@riverpod
Future<List<TesteModel>> getAllTestesViewModel(Ref ref) async {
  final testesRepository = getIt<TestesRepository>();
  final studentId = ref.watch(configViewModelProvider).value!.studentId;
  final result = await testesRepository.getListTestes(studentId);
  switch (result) {
    case Error<List<TesteModel>>():
      throw Exception(result.error);
    case Ok<List<TesteModel>>():
  }
  return result.value;
}

@riverpod
Future<TesteReportModel> getReportTestesViewModel(Ref ref) async {
  final testesRepository = getIt<TestesRepository>();
  final studentId = ref.watch(configViewModelProvider).value!.studentId;
  final result = await testesRepository.getTesteReport(
    studentId: studentId,
  );
  switch (result) {
    case Error<TesteReportModel>():
      throw Exception(result.error);
    case Ok<TesteReportModel>():
  }
  return result.value;
}

@riverpod
Future<List<QuestionModel>> startTesteViewModel(Ref ref, int testeId) async {
  final testesRepository = getIt<TestesRepository>();
  final result = await testesRepository.startTeste(testeId);
  switch (result) {
    case Error<List<QuestionModel>>():
      throw Exception(result.error);
    case Ok<List<QuestionModel>>():
  }
  return result.value;
}

@riverpod
class TestesViewModel extends _$TestesViewModel {
  @override
  Future<void> build() async {}

  Future<void> sendStudentAnswers({
    required Map<int, int> selectedAnswers,
    required int testeId,
  }) async {
    final testesRepository = getIt<TestesRepository>();
    final studentId = ref.watch(configViewModelProvider).value!.studentId;
    final result = await testesRepository.postStudentAnswers(
      studentId: studentId,
      testeId: testeId,
      selectedAnswers: selectedAnswers,
    );
    switch (result) {
      case Error<TesteModel>():
        throw Exception(result.error);
      case Ok<TesteModel>():
    }
  }
}
