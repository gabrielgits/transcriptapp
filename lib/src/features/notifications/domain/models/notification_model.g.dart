// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: (json['id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String,
      text: json['text'] as String,
      state: json['state'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'title': instance.title,
      'text': instance.text,
      'state': instance.state,
      'type': instance.type,
    };
