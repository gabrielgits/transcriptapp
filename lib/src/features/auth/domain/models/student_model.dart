import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'student_model.freezed.dart';
part 'student_model.g.dart';

@freezed
class StudentModel with _$StudentModel {
  const factory StudentModel({
    required int id,
    required String name,
    required String phone,
    required String photo,
    required int status,
    required int courseId,
  }) = _StudentModel;

  factory StudentModel.init() {
    return const StudentModel(
      id: 0,
      name: '',
      phone: '',
      photo: '',
      status: 0,
      courseId: 0,
    );
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);
}
