import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'answer_model.freezed.dart';
part 'answer_model.g.dart';

@freezed
class AnswerModel with _$AnswerModel {
  const factory AnswerModel({
    required int id,
    required String line,
    required String answer,
    required int questionId,
  }) = _AnswerModel;

  factory AnswerModel.init() {
    return const AnswerModel(
      id: 0,
      line: '',
      answer: '',
      questionId: 0,
    );
  }

  factory AnswerModel.fromJson(Map<String, Object?> json) =>
      _$AnswerModelFromJson(json);
}
