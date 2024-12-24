// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceReportModelImpl _$$AttendanceReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceReportModelImpl(
      percent: (json['percent'] as num).toDouble(),
      countAll: (json['countAll'] as num).toInt(),
      countPresent: (json['countPresent'] as num).toInt(),
      countAbsent: (json['countAbsent'] as num).toInt(),
      attributes: json['attributes'],
    );

Map<String, dynamic> _$$AttendanceReportModelImplToJson(
        _$AttendanceReportModelImpl instance) =>
    <String, dynamic>{
      'percent': instance.percent,
      'countAll': instance.countAll,
      'countPresent': instance.countPresent,
      'countAbsent': instance.countAbsent,
      'attributes': instance.attributes,
    };
