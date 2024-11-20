
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';

import 'answer_model.dart';
import 'question_model.dart';
import 'teste_model.dart';

part 'student_answer_model.freezed.dart';
part 'student_answer_model.g.dart';

@freezed
class StudentAnswerModel with _$StudentAnswerModel {
  const factory StudentAnswerModel({
    required int id,
    required StudentModel student,
    required QuestionModel question,
    required AnswerModel answer,
    required TesteModel teste,
  }) = _StudentAnswerModel;

  factory StudentAnswerModel.init() {
    return StudentAnswerModel(
      id: 0,
      student: StudentModel.init(),
      question: QuestionModel.init(),
      answer: AnswerModel.init(),
      teste: TesteModel.init(),
    );
  }

  factory StudentAnswerModel.fromJson(Map<String, Object?> json) =>
      _$StudentAnswerModelFromJson(json);
}
