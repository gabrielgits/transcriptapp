import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/core/dependency.dart';
import 'package:transcriptapp/src/features/attendances/domain/usecases/usecase_attendances.dart';

part '../../../auth/ui/view_models/user_attendances_controller.g.dart';

@riverpod
Future<Map<String, dynamic>> studentAttendances(Ref ref) async {
  final usecaseAttendances = getIt<UsecaseAttendances>();
   final studentId = ref.watch(controllerConfigsProvider).value!.studentId;
  final result = await usecaseAttendances.fetchReportAttendances(studentId);
  return result.attendances;
}