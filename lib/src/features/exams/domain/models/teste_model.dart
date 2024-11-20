import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';

import 'exam_model.dart';

part 'teste_model.freezed.dart';
part 'teste_model.g.dart';


@freezed
class TesteModel with _$TesteModel {
  const factory TesteModel({
    required int id,
    required String status,
    required double score,
    required double points,
    required ExamModel exam,
    required StudentModel student,
    required DateTime createdAt,
  }) = _TesteModel;

  factory TesteModel.init() {
    return TesteModel(
      id: 0,
      status: '',
      score: 0,
      points: 0,
      exam: ExamModel.init(),
      student: StudentModel.init(),
      createdAt: DateTime.now(),
    );
  }

  factory TesteModel.fromJson(Map<String, Object?> json) =>
      _$TesteModelFromJson(json);
}
