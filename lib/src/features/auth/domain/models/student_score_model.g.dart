// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentScoreModelImpl _$$StudentScoreModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentScoreModelImpl(
      testesAverage: (json['testesAverage'] as num).toDouble(),
      attendancesPercent: (json['attendancesPercent'] as num).toDouble(),
      dailypointsAverageFinal:
          (json['dailypointsAverageFinal'] as num).toDouble(),
      finalAverage: (json['finalAverage'] as num).toDouble(),
    );

Map<String, dynamic> _$$StudentScoreModelImplToJson(
        _$StudentScoreModelImpl instance) =>
    <String, dynamic>{
      'testesAverage': instance.testesAverage,
      'attendancesPercent': instance.attendancesPercent,
      'dailypointsAverageFinal': instance.dailypointsAverageFinal,
      'finalAverage': instance.finalAverage,
    };
