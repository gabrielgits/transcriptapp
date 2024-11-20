import 'package:expt/expt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:transcriptapp/src/features/exams/domain/models/exam_model.dart';
import 'package:transcriptapp/src/features/exams/domain/repositories/repository_remote_exams.dart';
import 'package:transcriptapp/src/features/exams/domain/usecases/usecase_exams.dart';

import 'usecase_exams_test.mocks.dart';

// Generate mocks using build_runner
@GenerateMocks([RepositoryRemoteExams])
void main() {
  late MockRepositoryRemoteExams mockRepositoryRemote;
  late UsecaseExams usecaseExams;

  setUp(() {
    mockRepositoryRemote = MockRepositoryRemoteExams();
    usecaseExams = UsecaseExams(mockRepositoryRemote);
  });

  test('fetchExams should return a list of exams and ExptWebNoExpt on success',
      () async {
    final exams = [
      ExamModel(
        id: 1,
        status: 'Math Exam',
        classe: 'Math',
        createdAt: DateTime.now(),
      ),
    ];
    when(mockRepositoryRemote.getListExams(1)).thenAnswer((_) async => exams);

    final result = await usecaseExams.fetchExams(1);

    expect(result.exams, exams);
    expect(result.exptWeb, isA<ExptWebNoExpt>());
  });

  test('fetchExams should return empty list and ExptWebPost on empty list',
      () async {
    when(mockRepositoryRemote.getListExams(1)).thenAnswer((_) async => []);

    final result = await usecaseExams.fetchExams(1);

    expect(result.exams, isEmpty);
    expect(result.exptWeb, isA<ExptWebPost>());
  });

  test('fetchExamDetails should return exam and ExptWebNoExpt on success',
      () async {
    final exam = ExamModel(
        id: 1,
        status: 'Math Exam',
        classe: 'Math',
        createdAt: DateTime.now(),
      );
    when(mockRepositoryRemote.getItemExam(1)).thenAnswer((_) async => exam);

    final result = await usecaseExams.fetchExamDetails(1);

    expect(result.exam, exam);
    expect(result.exptWeb, isA<ExptWebNoExpt>());
  });

  test(
      'fetchExamDetails should return init exam and ExptWebPost on exam not found',
      () async {
    when(mockRepositoryRemote.getItemExam(1))
        .thenAnswer((_) async => ExamModel.init());

    final result = await usecaseExams.fetchExamDetails(1);

    expect(result.exam, isA<ExamModel>());
    expect(result.exam.id, 0);
    expect(result.exptWeb, isA<ExptWebPost>());
  });
/*
  test('saveExam should return id and ExptWebNoExpt on success', () async {
    when(mockRepositoryRemote.postExam(any)).thenAnswer((_) async => 1);

    final result =
        await usecaseExams.saveExam(ExamModel(
        id: 1,
        status: 'Math Exam',
        classe: 'Math',
        createdAt: DateTime.now(),
      ));

    expect(result.id, 1);
    expect(result.exptWeb, isA<ExptWebNoExpt>());
  });

  test('saveExam should return 0 and ExptWebPost on failure', () async {
    when(mockRepositoryRemote.postExam(any)).thenAnswer((_) async => 0);

    final result =
        await usecaseExams.saveExam(ExamModel(
        id: 1,
        status: 'Math Exam',
        classe: 'Math',
        createdAt: DateTime.now(),
      ));

    expect(result.id, 0);
    expect(result.exptWeb, isA<ExptWebPost>());
  });
  */

  test('updateExam should return updated exam and ExptWebNoExpt on success',
      () async {
    final updatedExam = ExamModel(
        id: 1,
        status: 'Math Exam',
        classe: 'Math 2',
        createdAt: DateTime.now(),
      );

    when(mockRepositoryRemote.putExam(id: 1, newExam: updatedExam))
        .thenAnswer((_) async => updatedExam);

    final result = await usecaseExams.updateExam(id: 1, newExam: updatedExam);

    expect(result.exam, updatedExam);
    expect(result.exptWeb, isA<ExptWebNoExpt>());
  });

  test('updateExam should return init exam and ExptWebPost on failure',
      () async {
        
         final updatedExam = ExamModel(
        id: 1,
        status: 'Math Exam',
        classe: 'Math 2',
        createdAt: DateTime.now(),
      );

    when(mockRepositoryRemote.putExam(id: 1, newExam: updatedExam))
        .thenAnswer((_) async => ExamModel.init());

    final result = await usecaseExams.updateExam(
        id: 1, newExam: updatedExam,
      );

    expect(result.exam, isA<ExamModel>());
    expect(result.exam.id, 0);
    expect(result.exptWeb, isA<ExptWebPost>());
  });
}
