// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dailypoint_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailypointReportModelImpl _$$DailypointReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DailypointReportModelImpl(
      countAll: (json['countAll'] as num).toInt(),
      average: (json['average'] as num).toDouble(),
      attributes: json['attributes'],
    );

Map<String, dynamic> _$$DailypointReportModelImplToJson(
        _$DailypointReportModelImpl instance) =>
    <String, dynamic>{
      'countAll': instance.countAll,
      'average': instance.average,
      'attributes': instance.attributes,
    };
