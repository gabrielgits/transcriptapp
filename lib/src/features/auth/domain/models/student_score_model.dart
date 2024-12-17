import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'student_score_model.freezed.dart';
part 'student_score_model.g.dart';
            

@freezed
class StudentScoreModel with _$StudentScoreModel {
  const factory StudentScoreModel({
    required double testesAverage,
    required double attendancesPercent,
    required double dailypointsAverageFinal,
    required double finalAverage,
  }) = _StudentScoreModel;

  factory StudentScoreModel.init() {
    return const StudentScoreModel(
      testesAverage: 0,
      attendancesPercent: 0,
      dailypointsAverageFinal: 0,
      finalAverage: 0,
    );
  }

  factory StudentScoreModel.fromJson(Map<String, Object?> json) =>
      _$StudentScoreModelFromJson(json);
}
