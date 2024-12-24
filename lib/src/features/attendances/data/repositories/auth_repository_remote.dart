
import 'package:transcriptapp/src/shared/data/services/dio_client_service.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/attendance_model.dart';
import '../../domain/models/attendance_report_model.dart';
import 'exams_repository.dart';

class AttendancesRepositoryRemote implements AttendancesRepository {
  final DioClientService dioClientService;
  const AttendancesRepositoryRemote(this.dioClientService);

  @override
  Future<Result<List<AttendanceModel>>> getListAttendances(int id) async {
    try {
      final data = await dioClientService.getAttendances(id);
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
      final data = await dioClientService.getAttendanceReport(id);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(AttendanceReportModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
