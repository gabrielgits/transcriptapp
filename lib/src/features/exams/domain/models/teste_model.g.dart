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
      exam: ExamModel.fromJson(json['exam'] as Map<String, dynamic>),
      student: StudentModel.fromJson(json['student'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TesteModelImplToJson(_$TesteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'score': instance.score,
      'points': instance.points,
      'exam': instance.exam,
      'student': instance.student,
      'createdAt': instance.createdAt.toIso8601String(),
    };
