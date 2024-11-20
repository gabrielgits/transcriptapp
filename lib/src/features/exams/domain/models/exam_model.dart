import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'exam_model.freezed.dart';
part 'exam_model.g.dart';

@freezed
class ExamModel with _$ExamModel {
  const factory ExamModel({
    required int id,
    required String status,
    required String classe,
    required DateTime createdAt,
  }) = _ExamModel;

  factory ExamModel.init() {
    return ExamModel(
      id: 0,
      status: '',
      classe: '',
      createdAt: DateTime.now(),
    );
  }

  factory ExamModel.fromJson(Map<String, Object?> json) =>
      _$ExamModelFromJson(json);
}
