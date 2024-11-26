import 'package:expt/expt.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';
import 'package:transcriptapp/src/features/auth/domain/repositories/repository_local_auth.dart';
import 'package:transcriptapp/src/features/auth/domain/repositories/repository_remote_auth.dart';
import 'package:transcriptapp/src/features/auth/domain/usecases/usecase_auth.dart';

@GenerateNiceMocks(
    [MockSpec<RepositoryRemoteAuth>(), MockSpec<RepositoryLocalAuth>()])
import 'usecase_auth_test.mocks.dart';

void main() {
  late UsecaseAuth usecaseAuth;
  late MockRepositoryRemoteAuth mockRepositoryRemoteAuth;
  late MockRepositoryLocalAuth mockRepositoryLocalAuth;

  setUp(() {
    mockRepositoryRemoteAuth = MockRepositoryRemoteAuth();
    mockRepositoryLocalAuth = MockRepositoryLocalAuth();
    usecaseAuth = UsecaseAuth(
      repositoryRemote: mockRepositoryRemoteAuth,
      repositoryLocal: mockRepositoryLocalAuth,
    );
  });

  group('UsecaseAuth Tests', () {
    test(
        'logout: should return no exception when both remote and local actions succeed',
        () async {
      when(mockRepositoryRemoteAuth.logout())
          .thenAnswer((_) async => {'status': true});
      when(mockRepositoryLocalAuth.deleteConfigStudent())
          .thenAnswer((_) async => 1);

      final result = await usecaseAuth.logout();

      expect(result.exptData, isA<ExptDataNoExpt>());
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });


    test(
        'logout: should return ExptDataDelete local actions unsuccessful',
        () async {
      when(mockRepositoryRemoteAuth.logout())
          .thenAnswer((_) async => {'status': true});
      when(mockRepositoryLocalAuth.deleteConfigStudent())
          .thenAnswer((_) async => 0);

      final result = await usecaseAuth.logout();

      expect(result.exptData, isA<ExptDataDelete>());
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('logout: should return exception when remote logout fails', () async {
      when(mockRepositoryRemoteAuth.logout()).thenAnswer(
          (_) async => {'status': false, 'message': 'Network Error'});

      final result = await usecaseAuth.logout();

      expect(result.exptWeb, isA<ExptWebPost>());
    });

        test('logout: should return exception when remote logout fails', () async {
      when(mockRepositoryRemoteAuth.logout()).thenThrow(
          (_) async => throwsException );

      final result = await usecaseAuth.logout();

      expect(result.exptWeb, isA<ExptWebUnknown>());
      expect(result.exptData, isA<ExptDataUnknown>());
    });

    test('changePassword: should return no exception when password is updated',
        () async {
      when(mockRepositoryRemoteAuth.updatePassword(
        oldPassword: 'oldPassword',
        newPassword: 'newPassword',
      )).thenAnswer((_) async => {'status': true});

      final result = await usecaseAuth.changePassword(
          oldPassword: 'oldPassword', newPassword: 'newPassword');

      expect(result, isA<ExptWebNoExpt>());
    });

    test('changePassword: should return exception when password update fails',
        () async {
      when(mockRepositoryRemoteAuth.updatePassword(
        oldPassword: 'oldPassword',
        newPassword: 'newPassword',
      )).thenAnswer(
          (_) async => {'status': false, 'message': 'Invalid Credentials'});

      final result = await usecaseAuth.changePassword(
          oldPassword: 'oldPassword', newPassword: 'newPassword');

      expect(result, isA<ExptWebPost>());
    });

        test('changePassword: should return exception when updatePassword throwsException',
        () async {
      when(mockRepositoryRemoteAuth.updatePassword(
        oldPassword: 'oldPassword',
        newPassword: 'newPassword',
      )).thenThrow(
          throwsException);

      final result = await usecaseAuth.changePassword(
          oldPassword: 'oldPassword', newPassword: 'newPassword');

      expect(result, isA<ExptWebUnknown>());
    });

    test('forgotPassword: should return no exception when phone is found',
        () async {
      when(mockRepositoryRemoteAuth.forgotPassword('1234567890'))
          .thenAnswer((_) async => {'status': true});

      final result = await usecaseAuth.forgotPassword('1234567890');

      expect(result, isA<ExptWebNoExpt>());
    });

    test('forgotPassword: should return exception when phone is not found',
        () async {
      when(mockRepositoryRemoteAuth.forgotPassword('1234567890')).thenAnswer(
          (_) async => {'status': false, 'message': 'Email not found'});

      final result = await usecaseAuth.forgotPassword('1234567890');

      expect(result, isA<ExptWebPost>());
    });

        test('forgotPassword: should return exception when forgotPassword throwsException',
        () async {
      when(mockRepositoryRemoteAuth.forgotPassword('1234567890')).thenThrow(
          (_) async => throwsException);

      final result = await usecaseAuth.forgotPassword('1234567890');

      expect(result, isA<ExptWebUnknown>());
    });

    test(
        'signinWithPhone: should return student and no exception when sign in succeeds',
        () async {
      when(mockRepositoryRemoteAuth.signinWithPhone(
              phone: '1234567890', password: 'password'))
          .thenAnswer((_) async => {
                'status': true,
                'data': {'student': const StudentModel(
                  id: 1,
                  name: 'John Doe',
                  courseId: 1,
                  phone: '1234567890',
                  photo: '',
                  status: 1,
                ).toJson(), 'token': 'abc123'}
              });

      when(mockRepositoryLocalAuth.updateConfigStudent(
              studentId: anyNamed('studentId'), token: anyNamed('token')))
          .thenAnswer((_) async => 1);

      final result = await usecaseAuth.signinWithPhone(
          phone: '1234567890', password: 'password');

      expect(result.student, isA<StudentModel>());
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test(
        'signinWithPhone: should return exception when sign in was unsucceeful',
        () async {
      when(mockRepositoryRemoteAuth.signinWithPhone(
              phone: '1234567890', password: 'password'))
          .thenAnswer((_) async => {
                'status': false,
                'message': 'unsucceeful',
              });

      when(mockRepositoryLocalAuth.updateConfigStudent(
              studentId: anyNamed('studentId'), token: anyNamed('token')))
          .thenAnswer((_) async => 1);

      final result = await usecaseAuth.signinWithPhone(
          phone: '1234567890', password: 'password');

      expect(result.student, StudentModel.init());
      expect(result.exptWeb, isA<ExptWebPost>());
    });

        test(
        'signinWithPhone: should return exception when updateConfigStudent was unsucceeful',
        () async {
      when(mockRepositoryRemoteAuth.signinWithPhone(
              phone: '1234567890', password: 'password'))
          .thenAnswer((_) async => {
                'status': true,
                'data': {'student': const StudentModel(
                  id: 1,
                  name: 'John Doe',
                  courseId: 1,
                  phone: '1234567890',
                  photo: '',
                  status: 1,
                ).toJson(), 'token': 'abc123'}
              });

      when(mockRepositoryLocalAuth.updateConfigStudent(
              studentId: anyNamed('studentId'), token: anyNamed('token')))
          .thenAnswer((_) async => 0);

      final result = await usecaseAuth.signinWithPhone(
          phone: '1234567890', password: 'password');

      expect(result.student, StudentModel.init());
      expect(result.exptWeb, isA<ExptWebPost>());
    });

    test(
        'signinWithPhone: should return exception when signinWithPhone throwsException',
        () async {
      when(mockRepositoryRemoteAuth.signinWithPhone(
              phone: '1234567890', password: 'password'))
          .thenThrow((_) async => throwsException);


      final result = await usecaseAuth.signinWithPhone(
          phone: '1234567890', password: 'password');

      expect(result.student, StudentModel.init());
      expect(result.exptWeb, isA<ExptWebUnknown>());
    });

    test('signUp: should return student and no exception when sign up succeeds',
        () async {
      when(mockRepositoryRemoteAuth.signUp(any)).thenAnswer((_) async => {
            'status': true,
            'data': {
              'student': 
                const StudentModel(
                  id: 1,
                  name: 'John Doe',
                  courseId: 1,
                  phone: '1234567890',
                  photo: '',
                  status: 1,
                ).toJson()
              ,
              'token': 'abc123'
            }
          });

      when(mockRepositoryLocalAuth.updateConfigStudent(
              studentId: anyNamed('studentId'), token: anyNamed('token')))
          .thenAnswer((_) async => 1);

      final result = await usecaseAuth.signUp(
        name: 'John Doe',
        email: 'johndoe@example.com',
        password: 'password',
        courseId: 1,
      );

      expect(result.student, isA<StudentModel>());
      expect(result.exptWeb, isA<ExptWebNoExpt>());
    });

    test('signUp: should return exception when sign up was unsucceeful',
        () async {
      when(mockRepositoryRemoteAuth.signUp(any)).thenAnswer((_) async => {
            'status': false,
            'message': 'unsucceeful',
          });

      final result = await usecaseAuth.signUp(
        name: 'John Doe',
        email: 'johndoe@example.com',
        password: 'password',
        courseId: 1,
      );

      expect(result.student, StudentModel.init());
      expect(result.exptWeb, isA<ExptWebPost>());
    });

    test('signUp: should return exception when updateConfigStudent was unsucceeful',
        () async {
      when(mockRepositoryRemoteAuth.signUp(any)).thenAnswer((_) async => {
            'status': true,
            'data': {
              'student': 
                const StudentModel(
                  id: 1,
                  name: 'John Doe',
                  courseId: 1,
                  phone: '1234567890',
                  photo: '',
                  status: 1,
                ).toJson()
              ,
              'token': 'abc123'
            }
          });

      when(mockRepositoryLocalAuth.updateConfigStudent(
              studentId: anyNamed('studentId'), token: anyNamed('token')))
          .thenAnswer((_) async => 0);

      final result = await usecaseAuth.signUp(
        name: 'John Doe',
        email: 'johndoe@example.com',
        password: 'password',
        courseId: 1,
      );

      expect(result.student, StudentModel.init());
      expect(result.exptWeb, isA<ExptWebPost>());

    });

    test('signUp: should return exception when signUp throwsException',
        () async {
      when(mockRepositoryRemoteAuth.signUp(any)).thenThrow((_) async => throwsException);

      final result = await usecaseAuth.signUp(
        name: 'John Doe',
        email: 'johndoe@example.com',
        password: 'password',
        courseId: 1,
      );

      expect(result.student, StudentModel.init());
      expect(result.exptWeb, isA<ExptWebUnknown>());
    });

    test(
        'profile: should return student and no exception when profile is found',
        () async {
      when(mockRepositoryRemoteAuth.profile(1))
          .thenAnswer((_) async => {'status': true, 'data': const StudentModel(
                  id: 1,
                  name: 'John Doe',
                  courseId: 1,
                  phone: '1234567890',
                  photo: '',
                  status: 1,
                ).toJson()});

      final result = await usecaseAuth.profile(1);

      expect(result.student, isA<StudentModel>());
      expect(result.exception, isA<ExptWebNoExpt>());
    });

    test(
        'profile: should return exception when profile is not found',
        () async {
      when(mockRepositoryRemoteAuth.profile(1))
          .thenAnswer((_) async => {'status': false, 'message': 'not found'});

      final result = await usecaseAuth.profile(1);

      expect(result.student, StudentModel.init());
      expect(result.exception, isA<ExptWebGet>());
    });

    test(
        'profile: should return exception when profile throwsException',
        () async {
      when(mockRepositoryRemoteAuth.profile(1))
          .thenThrow((_) async => throwsException);

      final result = await usecaseAuth.profile(1);

      expect(result.student, StudentModel.init());
      expect(result.exception, isA<ExptWebUnknown>());
    });
  });
}
