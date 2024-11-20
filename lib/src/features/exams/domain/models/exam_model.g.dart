// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamModelImpl _$$ExamModelImplFromJson(Map<String, dynamic> json) =>
    _$ExamModelImpl(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      classe: json['classe'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ExamModelImplToJson(_$ExamModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'classe': instance.classe,
      'createdAt': instance.createdAt.toIso8601String(),
    };
