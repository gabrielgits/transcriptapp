import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'classe_model.freezed.dart';
part 'classe_model.g.dart';

@freezed
class ClasseModel with _$ClasseModel {
  const factory ClasseModel({
    required int id,
    required String summary,
    required int courseId
  }) = _ClasseModel;

  factory ClasseModel.init() {
    return const ClasseModel(
      id: 0,
      summary: '',
      courseId: 0
    );
  }

  factory ClasseModel.fromJson(Map<String, Object?> json) =>
      _$ClasseModelFromJson(json);
}
