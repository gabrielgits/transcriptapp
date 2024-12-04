// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentModelImpl _$$StudentModelImplFromJson(Map<String, dynamic> json) =>
    _$StudentModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      photo: json['photo'] as String,
      status: json['status'] as String,
      course: CourseModelModel.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StudentModelImplToJson(_$StudentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'photo': instance.photo,
      'status': instance.status,
      'course': instance.course,
    };
