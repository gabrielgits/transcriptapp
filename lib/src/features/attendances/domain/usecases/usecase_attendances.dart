import 'package:expt/expt.dart';

import '../models/attendance_model.dart';
import '../repositories/repository_remote_exams.dart';

class UsecaseAttendances {
  final RepositoryRemoteAttendances repositoryRemote;

  UsecaseAttendances(this.repositoryRemote);

  Future<({List<AttendanceModel> attendances, ExptWeb exptWeb})> fetchAttendances(
      int studentId) async {
    try {
      final resultWeb = await repositoryRemote.getListAttendances(studentId);
      if (resultWeb['status'] == false) {
        return (
          attendances: List<AttendanceModel>.empty(),
          exptWeb: ExptWebGet(
              'Problem to get attendances list: ${resultWeb["message"]}', 1),
        );
      }
      List<AttendanceModel> attendances = [];
      for (var attendanceJson in resultWeb['data']) {
        attendances.add(AttendanceModel.fromJson(attendanceJson));
      }
      return (attendances: attendances, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        attendances: List<AttendanceModel>.empty(),
        exptWeb: ExptWebUnknown('Error on get attendances: ${e.toString()}', 3),
      );
    }
  }

    Future<({Map<String, dynamic> attendances, ExptWeb exptWeb})> fetchReportAttendances(
      int studentId) async {
    try {
      final resultWeb = await repositoryRemote.getAttendanceReport(studentId);
      if (resultWeb['status'] == false) {
        return (
          attendances: <String, dynamic>{},
          exptWeb: ExptWebGet(
              'Problem to get attendances list: ${resultWeb["message"]}', 1),
        );
      }
      Map<String, dynamic> attendances = resultWeb['data'];
      return (attendances: attendances, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        attendances: <String, dynamic>{},
        exptWeb: ExptWebUnknown('Error on get attendances: ${e.toString()}', 3),
      );
    }
  }

}

