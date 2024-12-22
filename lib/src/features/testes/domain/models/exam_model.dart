import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:transcriptapp/src/shared/domain/models/classe_model.dart';

part 'exam_model.freezed.dart';
part 'exam_model.g.dart';

@freezed
class ExamModel with _$ExamModel {
  const factory ExamModel({
    required int id,
    required String name,
    required String status,
    required ClasseModel classe,
    required DateTime createdAt,
  }) = _ExamModel;

  factory ExamModel.init() {
    return ExamModel(
      id: 0,
      name: '',
      status: '',
      classe: ClasseModel.init(),
      createdAt: DateTime.now(),
    );
  }

  factory ExamModel.fromJson(Map<String, Object?> json) =>
      _$ExamModelFromJson(json);
}
