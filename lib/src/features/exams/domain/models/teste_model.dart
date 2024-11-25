import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'teste_model.freezed.dart';
part 'teste_model.g.dart';


@freezed
class TesteModel with _$TesteModel {
  const factory TesteModel({
    required int id,
    required String status,
    required double score,
    required double points,
    required int examId,
    required int studentId,
    required DateTime createdAt,
  }) = _TesteModel;

  factory TesteModel.init() {
    return TesteModel(
      id: 0,
      status: '',
      score: 0,
      points: 0,
      examId: 0,
      studentId: 0,
      createdAt: DateTime.now(),
    );
  }

  factory TesteModel.fromJson(Map<String, Object?> json) =>
      _$TesteModelFromJson(json);
}
