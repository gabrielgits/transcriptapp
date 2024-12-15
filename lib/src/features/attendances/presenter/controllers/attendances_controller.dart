import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/config/dependency.dart';
import 'package:transcriptapp/src/features/home/presenter/controllers/controller_configs.dart';

import '../../domain/models/attendance_model.dart';
import '../../domain/usecases/usecase_attendances.dart';

part 'attendances_controller.g.dart';


@riverpod
Future<List<AttendanceModel>> getAllAttendances(Ref ref) async {
  final usecaseAttendances = getIt<UsecaseAttendances>();
  final studentId = ref.watch(controllerConfigsProvider).value!.studentId;
  final result = await usecaseAttendances.fetchAttendances(studentId);
  return result.attendances;
}

@riverpod
Future<Map<String, dynamic>> getReportAttendances(Ref ref) async {
  final usecaseAttendances = getIt<UsecaseAttendances>();
   final studentId = ref.watch(controllerConfigsProvider).value!.studentId;
  final result = await usecaseAttendances.fetchReportAttendances(studentId);
  return result.attendances;
}