import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'attendance_report_model.freezed.dart';
part 'attendance_report_model.g.dart';


@freezed
class AttendanceReportModel with _$AttendanceReportModel {
  const factory AttendanceReportModel({
    required double percent,
    required int countAll,
    required int countPresent,
    required int countAbsent,
    attributes
  }) = _AttendanceReportModel;

  factory AttendanceReportModel.init() {
    return const AttendanceReportModel(
      percent: 0,
      countAll: 0,
      countPresent: 0,
      countAbsent: 0,
    );
  }

  factory AttendanceReportModel.fromJson(Map<String, Object?> json) =>
      _$AttendanceReportModelFromJson(json);
}
