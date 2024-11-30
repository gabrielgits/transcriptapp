
abstract class RepositoryRemoteDailypoints {
  Future<Map<String, dynamic>> getListDailypoints(int studentId);
  Future<Map<String, dynamic>> getDailypointReport(int studentId);
}
