import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required int id,
    required DateTime date,
    required String title,
    required String text,
    required String state,
    required String type,
  }) = _NotificationModel;

  factory NotificationModel.init() {
    return NotificationModel(
      id: 0,
      date: DateTime.now(),
      title: '',
      state: '',
      text: '',
      type: '',
    );
  }

  factory NotificationModel.fromJson(Map<String, Object?> json) =>
      _$NotificationModelFromJson(json);
}
