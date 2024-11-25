// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teste_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TesteModelImpl _$$TesteModelImplFromJson(Map<String, dynamic> json) =>
    _$TesteModelImpl(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      score: (json['score'] as num).toDouble(),
      points: (json['points'] as num).toDouble(),
      examId: (json['examId'] as num).toInt(),
      studentId: (json['studentId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TesteModelImplToJson(_$TesteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'score': instance.score,
      'points': instance.points,
      'examId': instance.examId,
      'studentId': instance.studentId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
