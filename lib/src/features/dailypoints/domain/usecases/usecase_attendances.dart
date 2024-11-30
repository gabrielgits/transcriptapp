import 'package:expt/expt.dart';

import '../models/dailypoint_model.dart';
import '../repositories/repository_remote_dailypoints.dart';

class UsecaseDailypoints {
  final RepositoryRemoteDailypoints repositoryRemote;

  UsecaseDailypoints(this.repositoryRemote);

  Future<({List<DailypointModel> dailypoints, ExptWeb exptWeb})> fetchDailypoints(
      int studentId) async {
    try {
      final resultWeb = await repositoryRemote.getListDailypoints(studentId);
      if (resultWeb['status'] == false) {
        return (
          dailypoints: List<DailypointModel>.empty(),
          exptWeb: ExptWebGet(
              'Problem to get dailypoints list: ${resultWeb["message"]}', 1),
        );
      }
      List<DailypointModel> dailypoints = [];
      for (var dailypointJson in resultWeb['data']) {
        dailypoints.add(DailypointModel.fromJson(dailypointJson));
      }
      return (dailypoints: dailypoints, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        dailypoints: List<DailypointModel>.empty(),
        exptWeb: ExptWebUnknown('Error on get dailypoints: ${e.toString()}', 3),
      );
    }
  }

    Future<({Map<String, dynamic> dailypoints, ExptWeb exptWeb})> fetchReportDailypoints(
      int studentId) async {
    try {
      final resultWeb = await repositoryRemote.getDailypointReport(studentId);
      if (resultWeb['status'] == false) {
        return (
          dailypoints: <String, dynamic>{},
          exptWeb: ExptWebGet(
              'Problem to get dailypoints list: ${resultWeb["message"]}', 1),
        );
      }
      Map<String, dynamic> dailypoints = resultWeb['data'];
      return (dailypoints: dailypoints, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        dailypoints: <String, dynamic>{},
        exptWeb: ExptWebUnknown('Error on get dailypoints: ${e.toString()}', 3),
      );
    }
  }

}

