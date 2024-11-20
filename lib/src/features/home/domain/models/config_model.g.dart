// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigModelImpl _$$ConfigModelImplFromJson(Map<String, dynamic> json) =>
    _$ConfigModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      studentId: (json['studentId'] as num).toInt(),
      token: json['token'] as String,
    );

Map<String, dynamic> _$$ConfigModelImplToJson(_$ConfigModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'studentId': instance.studentId,
      'token': instance.token,
    };
