import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'dailypoint_report_model.freezed.dart';
part 'dailypoint_report_model.g.dart';

@freezed
class DailypointReportModel with _$DailypointReportModel {
  const factory DailypointReportModel({
    required int countAll,
    required double average,
    attributes
  }) = _DailypointReportModel;

  factory DailypointReportModel.init() {
    return const DailypointReportModel(
      countAll: 0,
      average: 0.0,
    );
  }

  factory DailypointReportModel.fromJson(Map<String, Object?> json) =>
      _$DailypointReportModelFromJson(json);
}
