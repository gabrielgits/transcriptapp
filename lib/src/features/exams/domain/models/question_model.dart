import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'answer_model.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required int id,
    required String question,
    required String correctLine,
    required List<AnswerModel> answers,
    required int examId,
    required int answerId,
  }) = _QuestionModel;

  factory QuestionModel.init() {
    return const QuestionModel(
      id: 0,
      question: '',
      correctLine: '',
      answers: [],
      examId: 0,
      answerId: 0,
    );
  }

  factory QuestionModel.fromJson(Map<String, Object?> json) =>
      _$QuestionModelFromJson(json);
}
