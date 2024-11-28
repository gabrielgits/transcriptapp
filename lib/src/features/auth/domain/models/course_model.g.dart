// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseModelModelImpl _$$CourseModelModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseModelModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      room: json['room'] as String,
      teacher: TeacherModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CourseModelModelImplToJson(
        _$CourseModelModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'room': instance.room,
      'user': instance.teacher,
    };
