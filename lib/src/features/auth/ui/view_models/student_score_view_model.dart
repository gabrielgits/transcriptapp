import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/core/dependency.dart';
import 'package:transcriptapp/src/features/config/ui/view_models/config_view_model.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../data/repositories/auth_repository.dart';
import '../../domain/models/student_score_model.dart';

part 'view_model_student_score.g.dart';

@riverpod
Future<StudentScoreModel> studentScoreViewModel(Ref ref) async {
  final authRepository = getIt<AuthRepository>();
  final studentId = ref.watch(configViewModelProvider).value!.studentId;
  final result = await authRepository.getStudentScore(studentId);
  switch (result) {
    case Error<StudentScoreModel>():
      throw Exception(result.error);
    case Ok<StudentScoreModel>():
  }
  return result.value;
}
