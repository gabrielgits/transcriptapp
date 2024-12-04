import 'package:expt/expt.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/core/dependency.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';
import 'package:transcriptapp/src/features/auth/domain/usecases/usecase_auth.dart';
import 'package:transcriptapp/src/features/home/presenter/controllers/controller_configs.dart';

import '../viewmodels/student_view_model.dart';

part 'auth_controller.g.dart';

@riverpod
class UsersController extends _$UsersController {
  final _usecaseUsers = getIt<UsecaseAuth>();

  @override
  FutureOr<StudentViewModel> build() async {
    final configs = ref.watch(controllerConfigsProvider).value;
    if (configs == null) {
      return StudentViewModel(StudentModel.init());
    }
    final result = await _usecaseUsers.profile(configs.studentId);
    return StudentViewModel(result.student);
  }

  Future<bool> signinWithPhone(
      {required String phone, required String password}) async {
    state = const AsyncLoading();
    final result =
        await _usecaseUsers.signinWithPhone(phone: phone, password: password);
    if (result.exptWeb != ExptWebNoExpt()) {
      state = AsyncValue.data(StudentViewModel(StudentModel.init()));
      return false;
    }
    await ref.read(controllerConfigsProvider.notifier).loadConfig();
    state = AsyncValue.data(StudentViewModel(result.student));
    return true;
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    final result = await _usecaseUsers.logout();
    if (result.exptWeb != ExptWebNoExpt()) {
      state = AsyncError(result.exptWeb, StackTrace.current);
    }
    if (result.exptData != ExptDataNoExpt()) {
      state = AsyncError(result.exptData, StackTrace.current);
    }
    state = AsyncValue.data(StudentViewModel(StudentModel.init()));
  }

  Future<String> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final tempState = state;
    state = const AsyncLoading();
    final usecaseAuth = getIt<UsecaseAuth>();
    final studentId = ref.watch(controllerConfigsProvider).value!.studentId;
    final result = await usecaseAuth.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      studentId: studentId,
    );
    if (result != ExptWebNoExpt()) {
      state = tempState;
      return result.message;
    }
    state = tempState;
    return 'changed';
  }
}
