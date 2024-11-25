import 'package:expt/expt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:transcriptapp/src/features/exams/domain/models/exam_model.dart';
import 'package:transcriptapp/src/features/exams/domain/repositories/repository_remote_exams.dart';
import 'package:transcriptapp/src/features/exams/domain/usecases/usecase_exams.dart';


@GenerateNiceMocks([MockSpec<RepositoryRemoteExams>()])
import 'usecase_exams_test.mocks.dart';

void main() {
  late UsecaseExams usecaseExams;
  late MockRepositoryRemoteExams mockRepositoryRemoteExams;

  setUp(() {
    mockRepositoryRemoteExams = MockRepositoryRemoteExams();
    usecaseExams = UsecaseExams(mockRepositoryRemoteExams);
  });

  group('UsecaseExams Tests', () {
    test('fetchExams: should return list of exams when successful', () async {
      when(mockRepositoryRemoteExams.getListExams(any))
          .thenAnswer((_) async => {
                'status': true,
                'data': [
                  {'id': 1,  'classe': '1A', 'createdAt': '2022-01-01', 'status': 'pending'},
                  {'id': 2,  'classe': '2A', 'createdAt': '2022-01-01', 'status': 'pending'},
                ]
              });

      final result = await usecaseExams.fetchExams(1);

      expect(result.exams, isA<List<ExamModel>>());
      expect(result.exams.length, equals(2));
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('fetchExams: should return exception when failed', () async {
      when(mockRepositoryRemoteExams.getListExams(any))
          .thenAnswer((_) async => {'status': false, 'message': 'Error'});

      final result = await usecaseExams.fetchExams(1);

      expect(result.exams, isEmpty);
      expect(result.exptWeb, isA<ExptWebGet>());
    });

    test('fetchExamDetails: should return exam details when successful', () async {
      when(mockRepositoryRemoteExams.getItemExam(any))
          .thenAnswer((_) async => {
                'status': true,
                'data': {'id': 1,  'classe': '1A', 'createdAt': '2022-01-01', 'status': 'pending'}
              });

      final result = await usecaseExams.fetchExamDetails(1);

      expect(result.exam, isA<ExamModel>());
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('fetchExamDetails: should return exception when failed', () async {
      when(mockRepositoryRemoteExams.getItemExam(any))
          .thenAnswer((_) async => {'status': false, 'message': 'Not Found'});

      final result = await usecaseExams.fetchExamDetails(1);

      expect(result.exam, isA<ExamModel>());
      expect(result.exptWeb, isA<ExptWebGet>());
    });

    test('updateExam: should return updated exam when successful', () async {
      final newExam = ExamModel(id: 1,  classe: '1A', createdAt: DateTime.now(), status: 'pending');
      when(mockRepositoryRemoteExams.putExam(id: anyNamed('id'), json: anyNamed('json')))
          .thenAnswer((_) async => {
                'status': true,
                'data': {'id': 1,  'classe': '1A', 'createdAt': '2022-01-01', 'status': 'pending'}
              });

      final result = await usecaseExams.updateExam(id: 1, newExam: newExam);

      expect(result.exam, isA<ExamModel>());
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('updateExam: should return exception when update fails', () async {
      final newExam = ExamModel(id: 1,  classe: '1A', createdAt: DateTime.now(), status: 'pending');
      when(mockRepositoryRemoteExams.putExam(id: anyNamed('id'), json: anyNamed('json')))
          .thenAnswer((_) async => {'status': false, 'message': 'Update Failed'});

      final result = await usecaseExams.updateExam(id: 1, newExam: newExam);

      expect(result.exam, isA<ExamModel>());
      expect(result.exptWeb, isA<ExptWebPost>());
    });
  });
}
