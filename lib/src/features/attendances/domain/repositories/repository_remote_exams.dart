
abstract class RepositoryRemoteAttendances {
  Future<Map<String, dynamic>> getListAttendances(int studentId);
  Future<Map<String, dynamic>> getAttendanceReport(int studentId);
}
