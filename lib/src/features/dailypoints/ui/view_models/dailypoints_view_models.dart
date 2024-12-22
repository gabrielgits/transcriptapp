import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/core/dependency.dart';
import 'package:transcriptapp/src/features/config/ui/view_models/config_view_model.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../data/repositories/dailypoints_repository.dart';
import '../../domain/models/dailypoint_model.dart';
import '../../domain/models/dailypoint_report_model.dart';

part 'dailypoints_view_models.g.dart';

@riverpod
Future<List<DailypointModel>> getAllDailypointsViewModel(Ref ref) async {
  final dailypointsRepository = getIt<DailypointsRepository>();
  final studentId = ref.watch(configViewModelProvider).value!.studentId;
  final result = await dailypointsRepository.getListDailypoints(studentId);
  switch (result) {
    case Error<List<DailypointModel>>():
      throw Exception(result.error);
    case Ok<List<DailypointModel>>():
  }
  return result.value;
}

@riverpod
Future<DailypointReportModel> getReportDailypointsViewModel(Ref ref) async {
  final dailypointsRepository = getIt<DailypointsRepository>();
  final studentId = ref.watch(configViewModelProvider).value!.studentId;
  final result = await dailypointsRepository.getDailypointReport(studentId);
  switch (result) {
    case Error<DailypointReportModel>():
      throw Exception(result.error);
    case Ok<DailypointReportModel>():
  }
  return result.value;
}
