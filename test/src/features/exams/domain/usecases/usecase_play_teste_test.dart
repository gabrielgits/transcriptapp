import 'package:expt/expt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:transcriptapp/src/features/exams/domain/models/question_model.dart';
import 'package:transcriptapp/src/features/exams/domain/models/student_answer_model.dart';
import 'package:transcriptapp/src/features/exams/domain/repositories/repository_remote_exams.dart';
import 'package:transcriptapp/src/features/exams/domain/usecases/usecase_play_teste.dart';

@GenerateNiceMocks([MockSpec<RepositoryRemoteExams>()])
import 'usecase_play_teste_test.mocks.dart';

void main() {
  late UsecasePlayTeste usecasePlayTeste;
  late MockRepositoryRemoteExams mockRepositoryRemoteExams;

  setUp(() {
    mockRepositoryRemoteExams = MockRepositoryRemoteExams();
    usecasePlayTeste =
        UsecasePlayTeste(repositoryRemote: mockRepositoryRemoteExams);
  });

  group('UsecasePlayTeste Tests', () {
    test('fetchListQuestions: should return list of questions when successful',
        () async {
      final questionJson = {
        'id': 1,
        'question': 'What is the capital of France?',
        'correctLine': 'Paris',
        'examId': 1,
        'answerId': 1,
        'answer': [
          {'id': 1, 'answer': 'Paris', 'line': 'A', 'questionId': 1},
          {'id': 2, 'answer': 'London', 'line': 'B', 'questionId': 1},
          {'id': 3, 'answer': 'Rome', 'line': 'C', 'questionId': 1},
        ]
      };

      when(mockRepositoryRemoteExams.getListQuestions(any))
          .thenAnswer((_) async => {
                'status': true,
                'data': [questionJson, questionJson]
              });

      final result = await usecasePlayTeste.fetchListQuestions(1);

      expect(result.questions, isA<List<QuestionModel>>());
      expect(result.questions.length, equals(2));
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('fetchListQuestions: should return exception when failed', () async {
      when(mockRepositoryRemoteExams.getListQuestions(any))
          .thenAnswer((_) async => {'status': false, 'message': 'Error'});

      final result = await usecasePlayTeste.fetchListQuestions(1);

      expect(result.questions, isEmpty);
      expect(result.exptWeb, isA<ExptWebGet>());
    });

        test('fetchListQuestions: should return exception when  getListQuestions throwsException', () async {
      when(mockRepositoryRemoteExams.getListQuestions(any))
          .thenThrow((_) async => throwsException);

      final result = await usecasePlayTeste.fetchListQuestions(1);

      expect(result.questions, isEmpty);
      expect(result.exptWeb, isA<ExptWebUnknown>());
    });

    test(
        'fetchListStudentAnswers: should return list of student answers when successful',
        () async {

      final studentAnswerJson = {
        'id': 1,
        'studentId': 1, 
        'question': {
          'id': 1,
          'question': 'What is the capital of France?',
          'correctLine': 'A',
          'examId': 1,
          'answerId': 1,
          'answer': [
            {'id': 1, 'answer': 'Paris', 'line': 'A', 'questionId': 1},
            {'id': 2, 'answer': 'London', 'line': 'B', 'questionId': 1},
            {'id': 3, 'answer': 'Rome', 'line': 'C', 'questionId': 1},
          ],
        },
        'answer': {'id': 1, 'answer': 'Paris', 'line': 'A', 'questionId': 1},
        'testeId': 1
      };

      when(mockRepositoryRemoteExams.getListStudentAnswers(
              studentId: anyNamed('studentId'), testeId: anyNamed('testeId')))
          .thenAnswer((_) async => {
                'status': true,
                'data': [studentAnswerJson, studentAnswerJson]
              });

      final result = await usecasePlayTeste.fetchListStudentAnswers(
          studentId: 1, testeId: 1);

      expect(result.answers, isA<List<StudentAnswerModel>>());
      expect(result.answers.length, equals(2));
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('fetchListStudentAnswers: should return exception when failed',
        () async {
      when(mockRepositoryRemoteExams.getListStudentAnswers(
              studentId: anyNamed('studentId'), testeId: anyNamed('testeId')))
          .thenAnswer((_) async => {'status': false, 'message': 'Error'});

      final result = await usecasePlayTeste.fetchListStudentAnswers(
          studentId: 1, testeId: 1);

      expect(result.answers, isEmpty);
      expect(result.exptWeb, isA<ExptWebGet>());
    });

        test('fetchListStudentAnswers: should return exception when fetchListStudentAnswers throwsException',
        () async {
      when(mockRepositoryRemoteExams.getListStudentAnswers(
              studentId: anyNamed('studentId'), testeId: anyNamed('testeId')))
          .thenThrow((_) async => throwsException);

      final result = await usecasePlayTeste.fetchListStudentAnswers(
          studentId: 1, testeId: 1);

      expect(result.answers, isEmpty);
      expect(result.exptWeb, isA<ExptWebUnknown>());
    });

    test(
        'sendStudentAnswer: should return true when answer is sent successfully',
        () async {
      when(mockRepositoryRemoteExams.postStudentAnswers(selectedAnswers: anyNamed('selectedAnswers')))
          .thenAnswer((_) async => {'status': true});

      final result = await usecasePlayTeste.sendStudentAnswer(
        answerId: 1,
        questionId: 1,
        studentId: 1,
        testeId: 1,
      );

      expect(result.result, isTrue);
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('sendStudentAnswer: should return false when failed to send answer',
        () async {
      when(mockRepositoryRemoteExams.postStudentAnswers(any))
          .thenAnswer((_) async => {'status': false, 'message': 'Error'});

      final result = await usecasePlayTeste.sendStudentAnswer(
        answerId: 1,
        questionId: 1,
        studentId: 1,
        testeId: 1,
      );

      expect(result.result, isFalse);
      expect(result.exptWeb, isA<ExptWebPost>());
    });


    test('sendStudentAnswer: should Exception when postStudentAnswer throwsException',
        () async {
      when(mockRepositoryRemoteExams.postStudentAnswers(any))
          .thenThrow((_) async => throwsException);

      final result = await usecasePlayTeste.sendStudentAnswer(
        answerId: 1,
        questionId: 1,
        studentId: 1,
        testeId: 1,
      );

      expect(result.result, isFalse);
      expect(result.exptWeb, isA<ExptWebUnknown>());
    });

    test('startTeste: should return teste model when test starts successfully',
        () async {
      final test = {
        'status': true,
        'data': {
          'id': 1,
          'status': 'pending',
          'score': 0.0,
          'points': 0.0,
          'examId': 1,
          'studentId': 1,
          'createdAt': '2022-01-01',
        },
      };
      when(mockRepositoryRemoteExams.postTeste(
        studentId: anyNamed('studentId'),
        testeId: anyNamed('examId'),
      )).thenAnswer((_) async => test);

      final result = await usecasePlayTeste.startTeste(studentId: 1, testeId: 1);

      expect(result.questions.length, 1);
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('startTeste: should return exception when test fails to start',
        () async {
      when(mockRepositoryRemoteExams.postTeste(
              studentId: anyNamed('studentId'), testeId: anyNamed('examId')))
          .thenAnswer((_) async => {'status': false, 'message': 'Error'});

      final result = await usecasePlayTeste.startTeste(studentId: 1, testeId: 1);

      expect(result.questions.length, 0);
      expect(result.exptWeb, isA<ExptWebPost>());
    });

    test('startTeste: should return exception when postTeste throwsException to start',
        () async {
      when(mockRepositoryRemoteExams.postTeste(
              studentId: anyNamed('studentId'), testeId: anyNamed('examId')))
          .thenThrow((_) async => throwsException);

      final result = await usecasePlayTeste.startTeste(studentId: 1, testeId: 1);

      expect(result.questions.length, 0);
      expect(result.exptWeb, isA<ExptWebUnknown>());
    });
  });
}
