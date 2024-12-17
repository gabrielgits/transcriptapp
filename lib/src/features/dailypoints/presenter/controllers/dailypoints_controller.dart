import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/core/dependency.dart';
import 'package:transcriptapp/src/features/home/presenter/controllers/controller_configs.dart';

import '../../domain/models/dailypoint_model.dart';
import '../../domain/usecases/usecase_attendances.dart';

part 'dailypoints_controller.g.dart';


@riverpod
Future<List<DailypointModel>> getAllDailypoints(Ref ref) async {
  final usecaseDailypoints = getIt<UsecaseDailypoints>();
  final studentId = ref.watch(controllerConfigsProvider).value!.studentId;
  final result = await usecaseDailypoints.fetchDailypoints(studentId);
  return result.dailypoints;
}
  

@riverpod
Future<Map<String, dynamic>> getReportDailypoints(Ref ref) async {
  final usecaseDailypoints = getIt<UsecaseDailypoints>();
  final studentId = ref.watch(controllerConfigsProvider).value!.studentId;
  final result = await usecaseDailypoints.fetchReportDailypoints(studentId);
  return result.dailypoints;
}