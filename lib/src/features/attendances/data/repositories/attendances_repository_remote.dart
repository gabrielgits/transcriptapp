
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/attendance_model.dart';
import '../../domain/models/attendance_report_model.dart';
import '../services/attendances_api_services.dart';
import 'attendances_repository.dart';

class AttendancesRepositoryRemote implements AttendancesRepository {
  final AttendancesApiServices _attendancesApiServices;
  const AttendancesRepositoryRemote(this._attendancesApiServices);

  @override
  Future<Result<List<AttendanceModel>>> getListAttendances(int id) async {
    try {
      final data = await _attendancesApiServices.getAttendances(id);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      List<AttendanceModel> attendances = [];
      for (var attendanceJson in data['data']) {
        attendances.add(AttendanceModel.fromJson(attendanceJson));
      }
      return Result.ok(attendances);
    } on Exception catch (e) {
      return Result.error(e);
    }

  }

  @override
  Future<Result<AttendanceReportModel>> getAttendanceReport(int id) async {
    try {
      final data = await _attendancesApiServices.getAttendanceReport(id);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(AttendanceReportModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
