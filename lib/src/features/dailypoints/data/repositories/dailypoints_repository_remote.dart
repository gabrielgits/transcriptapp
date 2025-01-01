
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/dailypoint_model.dart';
import '../../domain/models/dailypoint_report_model.dart';
import '../services/dailypoints_api_services.dart';
import 'dailypoints_repository.dart';

class DailypointsRepositoryRemote implements DailypointsRepository {
  final DailypointsApiServices _dailypointsApiServices;
  const DailypointsRepositoryRemote(this._dailypointsApiServices);

  @override

  Future<Result<List<DailypointModel>>> getListDailypoints(int id) async {
    try {
      final data = await _dailypointsApiServices.getDailypoints(id);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      List<DailypointModel> dailypoints = [];
      for (var dailypointJson in data['data']) {
        dailypoints.add(DailypointModel.fromJson(dailypointJson));
      }
      return Result.ok(dailypoints);
    } on Exception catch (e) {
      return Result.error(e);
    }
 
  }

  @override
  Future<Result<DailypointReportModel>> getDailypointReport(int id) async {
    try {
      final data = await _dailypointsApiServices.getDailypointReport(id);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(DailypointReportModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
