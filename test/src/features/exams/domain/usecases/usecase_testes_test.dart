import 'package:expt/expt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';
import 'package:transcriptapp/src/features/exams/domain/models/exam_model.dart';
import 'package:transcriptapp/src/features/exams/domain/models/teste_model.dart';
import 'package:transcriptapp/src/features/exams/domain/repositories/repository_remote_exams.dart';
import 'package:transcriptapp/src/features/exams/domain/usecases/usecase_testes.dart';

import 'usecase_testes_test.mocks.dart';

// Generate mocks using build_runner
@GenerateMocks([RepositoryRemoteExams])
void main() {
  late MockRepositoryRemoteExams mockRepositoryRemote;
  late UsecaseTestes usecaseTestes;

  setUp(() {
    mockRepositoryRemote = MockRepositoryRemoteExams();
    usecaseTestes = UsecaseTestes(mockRepositoryRemote);
  });

  test(
      'fetchTestes should return a list of testes and ExptWebNoExpt on success',
      () async {
    final testes = [
      TesteModel(
        id: 1,
        status: 'Math Test',
        student: StudentModel.init(),
        score: 1,
        points: 1,
        exam: ExamModel.init(),
        createdAt: DateTime.now(),
      )
    ];
    when(mockRepositoryRemote.getListTestes(1)).thenAnswer((_) async => testes);

    final result = await usecaseTestes.fetchTestes(1);

    expect(result.testes, testes);
    expect(result.exptWeb, isA<ExptWebNoExpt>());
  });

  test('fetchTestes should return empty list and ExptWebPost on empty list',
      () async {
    when(mockRepositoryRemote.getListTestes(1)).thenAnswer((_) async => []);

    final result = await usecaseTestes.fetchTestes(1);

    expect(result.testes, isEmpty);
    expect(result.exptWeb, isA<ExptWebPost>());
  });

  test('fetchTesteDetails should return teste and ExptWebNoExpt on success',
      () async {
    final teste = TesteModel(
      id: 1,
      status: 'Math Test',
      student: StudentModel.init(),
      score: 1,
      points: 1,
      exam: ExamModel.init(),
      createdAt: DateTime.now(),
    );
    when(mockRepositoryRemote.getItemTeste(1)).thenAnswer((_) async => teste);

    final result = await usecaseTestes.fetchTesteDetails(1);

    expect(result.teste, teste);
    expect(result.exptWeb, isA<ExptWebNoExpt>());
  });

  test(
      'fetchTesteDetails should return init teste and ExptWebPost on teste not found',
      () async {
    when(mockRepositoryRemote.getItemTeste(1))
        .thenAnswer((_) async => TesteModel.init());

    final result = await usecaseTestes.fetchTesteDetails(1);

    expect(result.teste, isA<TesteModel>());
    expect(result.teste.id, 0);
    expect(result.exptWeb, isA<ExptWebPost>());
  });

  test('updateTeste should return updated teste and ExptWebNoExpt on success',
      () async {
    final updatedTeste = TesteModel(
      id: 1,
      status: 'Math Test Updated',
      student: StudentModel.init(),
      score: 2,
      points: 2,
      exam: ExamModel.init(),
      createdAt: DateTime.now(),
    );
    when(mockRepositoryRemote.putTeste(id: 1, newTeste: updatedTeste))
        .thenAnswer((_) async => updatedTeste);

    final result =
        await usecaseTestes.updateTeste(id: 1, newTeste: updatedTeste);

    expect(result.teste, updatedTeste);
    expect(result.exptWeb, isA<ExptWebNoExpt>());
  });

  test('updateTeste should return init teste and ExptWebPost on failure',
      () async {
    final updatedTeste = TesteModel(
      id: 1,
      status: 'Math Test Updated',
      student: StudentModel.init(),
      score: 2,
      points: 2,
      exam: ExamModel.init(),
      createdAt: DateTime.now(),
    );
    when(mockRepositoryRemote.putTeste(id: 1, newTeste: updatedTeste))
        .thenAnswer((_) async => TesteModel.init());

    final result = await usecaseTestes.updateTeste(
      id: 1,
      newTeste: updatedTeste,
    );

    expect(result.teste, isA<TesteModel>());
    expect(result.teste.id, 0);
    expect(result.exptWeb, isA<ExptWebPost>());
  });
}
