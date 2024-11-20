import 'package:expt/expt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';
import 'package:transcriptapp/src/features/exams/domain/models/answer_model.dart';
import 'package:transcriptapp/src/features/exams/domain/models/exam_model.dart';
import 'package:transcriptapp/src/features/exams/domain/models/question_model.dart';
import 'package:transcriptapp/src/features/exams/domain/models/student_answer_model.dart';
import 'package:transcriptapp/src/features/exams/domain/models/teste_model.dart';
import 'package:transcriptapp/src/features/exams/domain/repositories/repository_remote_exams.dart';
import 'package:transcriptapp/src/features/exams/domain/usecases/usecase_play_teste.dart';

import 'usecase_play_teste_test.mocks.dart';

// Generate mocks using build_runner
@GenerateMocks([RepositoryRemoteExams])
void main() {
  late MockRepositoryRemoteExams mockRepositoryRemote;
  late UsecasePlayTeste usecasePlayTeste;

  setUp(() {
    mockRepositoryRemote = MockRepositoryRemoteExams();
    usecasePlayTeste = UsecasePlayTeste(repositoryRemote: mockRepositoryRemote);
  });

  test(
      'fetchListQuestions should return a list of questions and ExptWebNoExpt on success',
      () async {
    final questions = [
      QuestionModel(
        id: 1,
        question: 'Sample Question',
        correctLine: 'A',
        answer: [AnswerModel.init()],
        examId: 1,
        answerId: 1,
      ),
    ];
    when(mockRepositoryRemote.getListQuestions(1))
        .thenAnswer((_) async => questions);

    final result = await usecasePlayTeste.fetchListQuestions(1);

    expect(result.questions, questions);
    expect(result.exptWeb, isA<ExptWebNoExpt>());
  });

  test(
      'fetchListQuestions should return empty list and ExptWebGet on empty list',
      () async {
    when(mockRepositoryRemote.getListQuestions(1)).thenAnswer((_) async => []);

    final result = await usecasePlayTeste.fetchListQuestions(1);

    expect(result.questions, isEmpty);
    expect(result.exptWeb, isA<ExptWebGet>());
  });

  test(
      'fetchListStudentAnswers should return a list of answers and ExptWebNoExpt on success',
      () async {
    final answers = [
      StudentAnswerModel(
        id: 1,
        student: StudentModel.init(),
        question: QuestionModel.init(),
        answer: AnswerModel.init(),
        teste: TesteModel.init(),
      ),
    ];
    when(mockRepositoryRemote.getListStudentAnswers(studentId: 1, testeId: 1))
        .thenAnswer((_) async => answers);

    final result = await usecasePlayTeste.fetchListStudentAnswers(
        studentId: 1, testeId: 1);

    expect(result.answers, answers);
    expect(result.exptWeb, isA<ExptWebNoExpt>());
  });

  test(
      'fetchListStudentAnswers should return empty list and ExptWebGet on empty list',
      () async {
    when(mockRepositoryRemote.getListStudentAnswers(studentId: 1, testeId: 1))
        .thenAnswer((_) async => []);

    final result = await usecasePlayTeste.fetchListStudentAnswers(
        studentId: 1, testeId: 1);

    expect(result.answers, isEmpty);
    expect(result.exptWeb, isA<ExptWebGet>());
  });

  test('sendStudentAnswer should return ExptWebNoExpt and true on success',
      () async {
    when(mockRepositoryRemote.postStudentAnswer(any))
        .thenAnswer((_) async => true);

    final result =
        await usecasePlayTeste.sendStudentAnswer(StudentAnswerModel.init());

    expect(result.result, true);
    expect(result.exptWeb, isA<ExptWebNoExpt>());
  });

  test('sendStudentAnswer should return ExptWebPost and false on failure',
      () async {
    when(mockRepositoryRemote.postStudentAnswer(any))
        .thenAnswer((_) async => false);

    final result =
        await usecasePlayTeste.sendStudentAnswer(StudentAnswerModel.init());

    expect(result.result, false);
    expect(result.exptWeb, isA<ExptWebPost>());
  });

  test('startTeste should return teste and ExptWebNoExpt on success', () async {
    final teste = TesteModel(
      id: 1,
      status: 'Math Test',
      student: StudentModel.init(),
      score: 1,
      points: 1,
      exam: ExamModel.init(),
      createdAt: DateTime.now(),
    );
    when(mockRepositoryRemote.postTeste(studentId: 1, examId: 1))
        .thenAnswer((_) async => teste);

    final result = await usecasePlayTeste.startTeste(studentId: 1, examId: 1);

    expect(result.teste, teste);
    expect(result.exptWeb, isA<ExptWebNoExpt>());
  });

  test('startTeste should return init teste and ExptWebPost on failure',
      () async {
    when(mockRepositoryRemote.postTeste(studentId: 1, examId: 1))
        .thenAnswer((_) async => TesteModel.init());

    final result = await usecasePlayTeste.startTeste(studentId: 1, examId: 1);

    expect(result.teste, isA<TesteModel>());
    expect(result.teste.id, 0);
    expect(result.exptWeb, isA<ExptWebPost>());
  });
}
