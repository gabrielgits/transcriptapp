// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamModelImpl _$$ExamModelImplFromJson(Map<String, dynamic> json) =>
    _$ExamModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      classe: ClasseModel.fromJson(json['classe'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ExamModelImplToJson(_$ExamModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'classe': instance.classe,
      'createdAt': instance.createdAt.toIso8601String(),
    };
