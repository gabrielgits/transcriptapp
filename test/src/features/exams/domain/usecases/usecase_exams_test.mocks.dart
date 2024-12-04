// Mocks generated by Mockito 5.4.4 from annotations
// in transcriptapp/test/src/features/exams/domain/usecases/usecase_exams_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:transcriptapp/src/features/exams/domain/repositories/repository_remote_exams.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [RepositoryRemoteExams].
///
/// See the documentation for Mockito's code generation for more information.
class MockRepositoryRemoteExams extends _i1.Mock
    implements _i2.RepositoryRemoteExams {
  @override
  _i3.Future<Map<String, dynamic>> getListExams(int? studentId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getListExams,
          [studentId],
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);

  @override
  _i3.Future<Map<String, dynamic>> getItemExam(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getItemExam,
          [id],
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);

  @override
  _i3.Future<Map<String, dynamic>> putExam({
    required int? id,
    required Map<String, dynamic>? json,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putExam,
          [],
          {
            #id: id,
            #json: json,
          },
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);

  @override
  _i3.Future<Map<String, dynamic>> getListTestes(int? studentId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getListTestes,
          [studentId],
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);

  @override
  _i3.Future<Map<String, dynamic>> getTesteReport({
    required int? studentId,
    required int? limit,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTesteReport,
          [],
          {
            #studentId: studentId,
            #limit: limit,
          },
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);

  @override
  _i3.Future<Map<String, dynamic>> getItemTeste(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getItemTeste,
          [id],
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);

  @override
  _i3.Future<Map<String, dynamic>> putTeste({
    required int? id,
    required Map<String, dynamic>? json,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #putTeste,
          [],
          {
            #id: id,
            #json: json,
          },
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);

  @override
  _i3.Future<Map<String, dynamic>> getListQuestions(int? examId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getListQuestions,
          [examId],
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);

  @override
  _i3.Future<Map<String, dynamic>> postStudentAnswers({
    required int? studentId,
    required int? testeId,
    required Map<String, dynamic>? selectedAnswers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postStudentAnswers,
          [],
          {
            #studentId: studentId,
            #testeId: testeId,
            #selectedAnswers: selectedAnswers,
          },
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);

  @override
  _i3.Future<Map<String, dynamic>> getListStudentAnswers({
    required int? studentId,
    required int? testeId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getListStudentAnswers,
          [],
          {
            #studentId: studentId,
            #testeId: testeId,
          },
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);

  @override
  _i3.Future<Map<String, dynamic>> postTeste({
    required int? studentId,
    required int? testeId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postTeste,
          [],
          {
            #studentId: studentId,
            #testeId: testeId,
          },
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
        returnValueForMissingStub:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);
}
