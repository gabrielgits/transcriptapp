import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/config/dependency.dart';
import 'package:transcriptapp/src/features/attendances/domain/usecases/usecase_attendances.dart';
import 'package:transcriptapp/src/features/home/presenter/controllers/controller_configs.dart';

part 'user_attendances_controller.g.dart';

@riverpod
Future<Map<String, dynamic>> getUserAttendances(Ref ref) async {
  final usecaseAttendances = getIt<UsecaseAttendances>();
   final studentId = ref.watch(controllerConfigsProvider).value!.studentId;
  final result = await usecaseAttendances.fetchReportAttendances(studentId);
  return result.attendances;
}