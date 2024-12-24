
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/core/dependency.dart';
import 'package:transcriptapp/src/features/config/ui/view_models/config_view_model.dart';
import 'package:transcriptapp/src/utils/result.dart';


import '../../data/repositories/auth_repository.dart';
import '../../domain/models/student_model.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  final _authRepository = getIt<AuthRepository>();

  @override
  FutureOr<StudentModel> build() async {
    return Future.value(StudentModel.init()) ;
  }

  Future<void> signinWithPhone(
      {required String phone, required String password}) async {
    state = const AsyncLoading();
    final result =
        await _authRepository.signinWithPhone(phone: phone, password: password);
    switch (result) {
      case Error<StudentModel>():
        state = AsyncError(result.error, StackTrace.current);
        return;

      case Ok<StudentModel>():
    }
    
    state = AsyncValue.data(result.value);
  }

  Future<StudentModel> getProfile() async {
    state = const AsyncLoading();
    final config = ref.watch(configViewModelProvider).value!;
    final result = await _authRepository.profile(config.studentId);
    switch (result) {
      case Error<StudentModel>():
        state = AsyncError(result.error, StackTrace.current);
        return StudentModel.init();

      case Ok<StudentModel>():
    }
    state = AsyncValue.data(result.value);
    return result.value;
  }

  Future<String> logout() async {
    state = const AsyncLoading();
    final result = await _authRepository.logout();
    switch (result) {
      case Error<String>():
        state = AsyncError(result.error, StackTrace.current);
        return result.error.toString();
      case Ok<String>():
    } 
    state = AsyncValue.data(StudentModel.init());
    return result.value;
  }

  Future<String> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final tempState = state;
    state = const AsyncLoading();
    final config = ref.watch(configViewModelProvider).value!;
    final result = await _authRepository.updatePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      studentId: config.studentId,
    );
    switch (result) {
      case Error<String>():
        state = AsyncError(result.error, StackTrace.current);
        return result.error.toString();
      case Ok<String>():
    } 
    state = tempState;
    return 'changed';
  }
}
