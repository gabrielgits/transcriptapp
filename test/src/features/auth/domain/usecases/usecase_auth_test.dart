import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:expt/expt.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';
import 'package:transcriptapp/src/features/auth/domain/repositories/repository_local_auth.dart';
import 'package:transcriptapp/src/features/auth/domain/repositories/repository_remote_auth.dart';
import 'package:transcriptapp/src/features/auth/domain/usecases/usecase_auth.dart';

// Mock classes
@GenerateNiceMocks([MockSpec<RepositoryRemoteAuth>()])
@GenerateNiceMocks([MockSpec<RepositoryLocalAuth>()])

import 'usecase_auth_test.mocks.dart';

void main() {
  group('UsecaseAuth', () {
    late MockRepositoryRemoteAuth mockRepositoryRemote;
    late MockRepositoryLocalAuth mockRepositoryLocal;
    late UsecaseAuth usecaseAuth;

    setUp(() {
      mockRepositoryRemote = MockRepositoryRemoteAuth();
      mockRepositoryLocal = MockRepositoryLocalAuth();
      usecaseAuth = UsecaseAuth(
        repositoryRemote: mockRepositoryRemote,
        repositoryLocal: mockRepositoryLocal,
      );
    });

    test('logout should return ExptDataNoExpt and ExptWebNoExpt on success',
        () async {
      when(mockRepositoryRemote.logout()).thenAnswer((_) async => true);
      when(mockRepositoryLocal.deleteItem(any))
          .thenAnswer((_) async => 1);

      final result = await usecaseAuth.logout(1);

      expect(result.exptData, isA<ExptDataNoExpt>());
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('logout should return ExptDataUnknown and ExptWebUnknown on exception',
        () async {
      when(mockRepositoryRemote.logout()).thenThrow(Exception('Logout failed'));

      final result = await usecaseAuth.logout(1);

      expect(result.exptData, isA<ExptDataUnknown>());
      expect(result.exptWeb, isA<ExptWebUnknown>());
    });

    test('updateStudentIdConfig should return ExptDataNoExpt on success',
        () async {
      when(mockRepositoryLocal.updateStudentIdConfig(any))
          .thenAnswer((_) async => 1);

      final result = await usecaseAuth.updateStudentIdConfig(123);

      expect(result.exception, isA<ExptDataNoExpt>());
      expect(result.id, 1);
    });

    test('changePassword should return ExptWebNoExpt on success', () async {
      when(mockRepositoryRemote.updatePassword('new_password'))
          .thenAnswer((_) async => true);

      final result = await usecaseAuth.changePassword('new_password');

      expect(result, isA<ExptWebNoExpt>());
    });

    test('forgotPassword should return ExptWebNoExpt on success', () async {
      when(mockRepositoryRemote.forgotPassword('test_email'))
          .thenAnswer((_) async => true);

      final result = await usecaseAuth.forgotPassword('test_email');

      expect(result, isA<ExptWebNoExpt>());
    });

    test('signinWithPhone should return student and ExptWebNoExpt on success',
        () async {
      const student = StudentModel(
        id: 1,
        name: 'John Doe',
        phone: '123',
        photo: 'photo',
        status: 1,
      );
      when(mockRepositoryRemote.signinWithPhone(phone: '123', password: 'pass'))
          .thenAnswer((_) async => student);
      when(mockRepositoryLocal.saveItem(student)).thenAnswer((_) async => 1);

      final result =
          await usecaseAuth.signinWithPhone(phone: '123', password: 'pass');

      expect(result.student, student);
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('recoveryPassword should return ExptWebNoExpt on success', () async {
      when(mockRepositoryRemote.recoveryPassword(
              code: 'code', newPassword: 'new_password'))
          .thenAnswer((_) async => true);

      final result = await usecaseAuth.recoveryPassword(
          code: 'code', newPassword: 'new_password');

      expect(result.exception, isA<ExptWebNoExpt>());
      expect(result.result, true);
    });

    test('loadStudent should return student and ExptDataNoExpt on success',
        () async {
      const student = StudentModel(
        id: 1,
        name: 'John Doe',
        phone: '123',
        photo: 'photo',
        status: 1,
      );
      when(mockRepositoryLocal.getItem(1))
          .thenAnswer((_) async => student);

      final result = await usecaseAuth.loadStudent(1);

      expect(result.item, student);
      expect(result.exception, isA<ExptDataNoExpt>());
    });
  });
}
