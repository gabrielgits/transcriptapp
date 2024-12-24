import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:transcriptapp/src/shared/domain/models/classe_model.dart';

part 'attendance_model.freezed.dart';
part 'attendance_model.g.dart';

@freezed
class AttendanceModel with _$AttendanceModel {
  const factory AttendanceModel({
    required int id,
    required String status,
    required int studentId,
    required int classeId,
    required ClasseModel classe,
    required DateTime createdAt,
  }) = _AttendanceModel;

  factory AttendanceModel.init() {
    return AttendanceModel(
      id: 0,
      status: '',
      studentId: 0,
      classeId: 0,
      classe: ClasseModel.init(),
      createdAt: DateTime.now(),
    );
  }

  factory AttendanceModel.fromJson(Map<String, Object?> json) =>
      _$AttendanceModelFromJson(json);
}
