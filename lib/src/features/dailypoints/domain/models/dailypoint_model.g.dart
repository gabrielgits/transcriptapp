// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dailypoint_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailypointModelImpl _$$DailypointModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DailypointModelImpl(
      id: (json['id'] as num).toInt(),
      point: (json['point'] as num).toInt(),
      studentId: (json['studentId'] as num).toInt(),
      classeId: (json['classeId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$DailypointModelImplToJson(
        _$DailypointModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'studentId': instance.studentId,
      'classeId': instance.classeId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
