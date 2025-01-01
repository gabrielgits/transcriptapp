import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/core/dependency.dart';
import 'package:transcriptapp/src/features/config/ui/view_models/config_view_model.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../data/repositories/attendances_repository.dart';
import '../../domain/models/attendance_model.dart';
import '../../domain/models/attendance_report_model.dart';

part 'attendances_view_model.g.dart';


@riverpod
Future<List<AttendanceModel>> getAllAttendancesViewModel(Ref ref) async {

  final attendancesRepository = getIt<AttendancesRepository>();
  final studentId = ref.watch(configViewModelProvider).value!.studentId;
  final result = await attendancesRepository.getListAttendances(studentId);
  switch (result) {
    case Error<List<AttendanceModel>>():
      throw Exception(result.error);
    case Ok<List<AttendanceModel>>():
  }
  return result.value;
}

@riverpod
Future<AttendanceReportModel> getReportAttendancesViewModel(Ref ref) async {

  final attendancesRepository = getIt<AttendancesRepository>();
  final studentId = ref.watch(configViewModelProvider).value!.studentId;
  final result = await attendancesRepository.getAttendanceReport(studentId);
  switch (result) {
    case Error<AttendanceReportModel>():
      throw Exception(result.error);
    case Ok<AttendanceReportModel>():
  }
  return result.value;
}