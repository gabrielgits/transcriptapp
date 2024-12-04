// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClasseModelImpl _$$ClasseModelImplFromJson(Map<String, dynamic> json) =>
    _$ClasseModelImpl(
      id: (json['id'] as num).toInt(),
      summary: json['summary'] as String,
      courseId: (json['courseId'] as num).toInt(),
    );

Map<String, dynamic> _$$ClasseModelImplToJson(_$ClasseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'summary': instance.summary,
      'courseId': instance.courseId,
    };
