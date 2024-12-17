import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'config_model.freezed.dart';
part 'config_model.g.dart';

@freezed
class ConfigModel with _$ConfigModel {
  const factory ConfigModel({
    required int id,
    required String name,
    required int studentId,
    required String token,
    required String language,
  }) = _ConfigModel;

  factory ConfigModel.init() {
    return const ConfigModel(
      id: 0,
      name: '',
      studentId: 0,
      token: '',
      language: '',
    );
  }

  factory ConfigModel.fromJson(Map<String, Object?> json) =>
      _$ConfigModelFromJson(json);
}
