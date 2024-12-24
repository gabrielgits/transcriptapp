
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/attendance_model.dart';
import '../../domain/models/attendance_report_model.dart';

abstract class AttendancesRepository {
  Future<Result<List<AttendanceModel>>>  getListAttendances(int studentId);
  Future<Result<AttendanceReportModel>> getAttendanceReport(int studentId);
}
