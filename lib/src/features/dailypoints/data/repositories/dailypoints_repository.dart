
import 'package:transcriptapp/src/features/dailypoints/domain/models/dailypoint_report_model.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/dailypoint_model.dart';

abstract class DailypointsRepository {
  Future<Result<List<DailypointModel>>>  getListDailypoints(int studentId);
  Future<Result<DailypointReportModel>> getDailypointReport(int studentId);
}
