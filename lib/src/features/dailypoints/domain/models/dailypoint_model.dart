import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:transcriptapp/src/shared/domain/models/classe_model.dart';

part 'dailypoint_model.freezed.dart';
part 'dailypoint_model.g.dart';

@freezed
class DailypointModel with _$DailypointModel {
  const factory DailypointModel({
    required int id,
    required int point,
     required int studentId,
    required int classeId,
    required ClasseModel classe,
    required DateTime createdAt,
  }) = _DailypointModel;

  factory DailypointModel.init() {
    return  DailypointModel(
      id: 0,
      point: 0,
      studentId: 0,
      classeId: 0,
      classe: ClasseModel.init(),
      createdAt: DateTime.now(),
    );
  }

  factory DailypointModel.fromJson(Map<String, Object?> json) =>
      _$DailypointModelFromJson(json);
}
