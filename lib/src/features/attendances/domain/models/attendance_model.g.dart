// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceModelImpl _$$AttendanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceModelImpl(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      studentId: (json['studentId'] as num).toInt(),
      classeId: (json['classeId'] as num).toInt(),
      classe: ClasseModel.fromJson(json['classe'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AttendanceModelImplToJson(
        _$AttendanceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'studentId': instance.studentId,
      'classeId': instance.classeId,
      'classe': instance.classe,
      'createdAt': instance.createdAt.toIso8601String(),
    };
