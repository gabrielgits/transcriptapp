
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'answer_model.dart';
import 'question_model.dart';

part 'student_answer_model.freezed.dart';
part 'student_answer_model.g.dart';

@freezed
class StudentAnswerModel with _$StudentAnswerModel {
  const factory StudentAnswerModel({
    required int id,
    required int studentId,
    required QuestionModel question,
    required AnswerModel answer,
    required int testeId,
  }) = _StudentAnswerModel;

  factory StudentAnswerModel.init() {
    return StudentAnswerModel(
      id: 0,
      studentId: 0,
      question: QuestionModel.init(),
      answer: AnswerModel.init(),
      testeId: 0,
    );
  }

  factory StudentAnswerModel.fromJson(Map<String, Object?> json) =>
      _$StudentAnswerModelFromJson(json);
}
