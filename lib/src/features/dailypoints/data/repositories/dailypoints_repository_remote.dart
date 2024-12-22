import 'package:transcriptapp/src/shared/data/services/dio_client_service.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/dailypoint_model.dart';
import '../../domain/models/dailypoint_report_model.dart';
import 'dailypoints_repository.dart';

class DailypointsRepositoryRemote implements DailypointsRepository {
  final DioClientService dioClientService;
  const DailypointsRepositoryRemote(this.dioClientService);

  @override
  Future<Result<List<DailypointModel>>> getListDailypoints(int id) async {
    try {
      final data = await dioClientService.getDailypoints(id);
      if (data['status'] == false) {
        return Result.error(data['message']);
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
      final data = await dioClientService.getDailypointReport(id);
      if (data['status'] == false) {
        return Result.error(data['message']);
      }
      return Result.ok(DailypointReportModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
