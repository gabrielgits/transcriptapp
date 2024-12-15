
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/config/dependency.dart';
import 'package:transcriptapp/src/features/home/presenter/controllers/controller_configs.dart';

import '../../domain/usecases/usecase_auth.dart';

part 'student_score_controller.g.dart';


@riverpod
Future<Map<String, dynamic>> getStudentScore(Ref ref) async {
  final usecaseAuth = getIt<UsecaseAuth>();
   final studentId = ref.watch(controllerConfigsProvider).value!.studentId;
  final result = await usecaseAuth.fetchStudentScore(studentId);
  return result.scoreReport;
}