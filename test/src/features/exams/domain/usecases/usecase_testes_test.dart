import 'package:expt/expt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:transcriptapp/src/features/exams/domain/models/exam_model.dart';
import 'package:transcriptapp/src/features/exams/domain/models/teste_model.dart';
import 'package:transcriptapp/src/features/exams/domain/repositories/repository_remote_exams.dart';
import 'package:transcriptapp/src/features/exams/domain/usecases/usecase_testes.dart';

@GenerateNiceMocks([MockSpec<RepositoryRemoteExams>()])
import 'usecase_testes_test.mocks.dart';

void main() {
  late UsecaseTestes usecaseTestes;
  late MockRepositoryRemoteExams mockRepositoryRemoteExams;

  setUp(() {
    mockRepositoryRemoteExams = MockRepositoryRemoteExams();
    usecaseTestes = UsecaseTestes(mockRepositoryRemoteExams);
  });

  group('UsecaseTestes Tests', () {
      final newTeste = TesteModel(
        id: 1,
        status: 'pending',
        score: 0.0,
        points: 0.0,
        exam: ExamModel.init(),
        studentId: 1,
        createdAt: DateTime.now(),
      );
    test('fetchTestes: should return list of testes when successful', () async {
      when(mockRepositoryRemoteExams.getListTestes(any))
          .thenAnswer((_) async => {
                'status': true,
                'data': [
                  newTeste.toJson(),
                  newTeste.copyWith(id: 2).toJson(),
                ]
              });

      final result = await usecaseTestes.fetchTestes(1);

      expect(result.testes, isA<List<TesteModel>>());
      expect(result.testes.length, equals(2));
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('fetchTestes: should return exception when failed', () async {
      when(mockRepositoryRemoteExams.getListTestes(any))
          .thenAnswer((_) async => {'status': false, 'message': 'Error'});

      final result = await usecaseTestes.fetchTestes(1);

      expect(result.testes, isEmpty);
      expect(result.exptWeb, isA<ExptWebGet>());
    });

        test('fetchTestes: should return exception when getListTestes throwsException', () async {
      when(mockRepositoryRemoteExams.getListTestes(any))
          .thenThrow((_) async => throwsException);

      final result = await usecaseTestes.fetchTestes(1);

      expect(result.testes, isEmpty);
      expect(result.exptWeb, isA<ExptWebUnknown>());
    });

    test('fetchTesteDetails: should return teste details when successful',
        () async {
      when(mockRepositoryRemoteExams.getItemTeste(any))
          .thenAnswer((_) async => {
                'status': true,
                'data': newTeste.toJson()
              });

      final result = await usecaseTestes.fetchTesteDetails(1);

      expect(result.teste, isA<TesteModel>());
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('fetchTesteDetails: should return exception when failed', () async {
      when(mockRepositoryRemoteExams.getItemTeste(any))
          .thenAnswer((_) async => {'status': false, 'message': 'Not Found'});

      final result = await usecaseTestes.fetchTesteDetails(1);

      expect(result.teste, isA<TesteModel>());
      expect(result.exptWeb, isA<ExptWebGet>());
    });

        test('fetchTesteDetails: should return exception when getItemTeste throwsException', () async {
      when(mockRepositoryRemoteExams.getItemTeste(any))
          .thenThrow((_) async =>throwsException);

      final result = await usecaseTestes.fetchTesteDetails(1);

      expect(result.teste, isA<TesteModel>());
      expect(result.exptWeb, isA<ExptWebUnknown>());
    });

    test('updateTeste: should return updated teste when successful', () async {

      when(mockRepositoryRemoteExams.putTeste(
              id: anyNamed('id'), json: anyNamed('json')))
          .thenAnswer((_) async => {
                'status': true,
                'data': newTeste.toJson()
              });

      final result = await usecaseTestes.updateTeste(id: 1, newTeste: newTeste);

      expect(result.teste, isA<TesteModel>());
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('updateTeste: should return exception when update fails', () async {

      when(mockRepositoryRemoteExams.putTeste(
              id: anyNamed('id'), json: anyNamed('json')))
          .thenAnswer(
              (_) async => {'status': false, 'message': 'Update Failed'});

      final result = await usecaseTestes.updateTeste(id: 1, newTeste: newTeste);

      expect(result.teste, isA<TesteModel>());
      expect(result.exptWeb, isA<ExptWebPost>());
    });

        test('updateTeste: should return exception when putTeste throwsException', () async {

      when(mockRepositoryRemoteExams.putTeste(
              id: anyNamed('id'), json: anyNamed('json')))
          .thenThrow(
              (_) async => throwsException);

      final result = await usecaseTestes.updateTeste(id: 1, newTeste: newTeste);

      expect(result.teste, isA<TesteModel>());
      expect(result.exptWeb, isA<ExptWebUnknown>());
    });
  });
}
