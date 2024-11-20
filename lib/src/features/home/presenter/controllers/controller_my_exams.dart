import 'package:expt/expt.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/dependency.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';
import 'package:transcriptapp/src/features/auth/presenter/viewmodels/student_view_model.dart';
import 'package:transcriptapp/src/features/home/domain/usecase/usecase_exams.dart';

import 'controller_configs.dart';

part 'controller_my_exams.g.dart';

@riverpod
class ControllerMyStudents extends _$ControllerMyStudents {
  @override
  FutureOr<List<StudentViewModel>> build() async {
    return await receiveAllStudents();
  }

  Future<List<StudentViewModel>> receiveAllStudents() async {
    state = const AsyncLoading();
    final config = await ref.read(controllerConfigsProvider.future);
    if (config.studentId == 0) {
      state = const AsyncData([]);
      return [];
    }
    final result = await getIt<UsecaseExams>().fetchMyExams(config.studentId.toString());
    if (result.exception != ExptWebNoExpt()) {
      state = AsyncError(result.exception, StackTrace.current);
      throw Exception(result.exception);
    }
    if (result.list.isEmpty) {
      state = const AsyncData([]);
      return [];
    }
    final result2 = result.list.map((item) => StudentViewModel(StudentModel.init())).toList();
    state = AsyncData(result2);
    return result2;
  }
}
