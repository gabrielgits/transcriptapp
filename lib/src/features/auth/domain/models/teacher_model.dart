import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'teacher_model.freezed.dart';
part 'teacher_model.g.dart';

@freezed
class TeacherModel with _$TeacherModel {
  const factory TeacherModel({
    required int id,
    required String name,
    required String email,
  }) = _TeacherModel;

  factory TeacherModel.init() {
    return const TeacherModel(
      id: 0,
      name: '',
      email: '',
      
    );
  }

  factory TeacherModel.fromJson(Map<String, Object?> json) =>
      _$TeacherModelFromJson(json);
}
