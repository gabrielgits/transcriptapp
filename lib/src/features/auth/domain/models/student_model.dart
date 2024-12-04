import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:transcriptapp/src/features/auth/domain/models/course_model.dart';

part 'student_model.freezed.dart';
part 'student_model.g.dart';

@freezed
class StudentModel with _$StudentModel {
  const factory StudentModel({
    required int id,
    required String name,
    required String phone,
    required String photo,
    required String status,
    required CourseModelModel course,
  }) = _StudentModel;

  factory StudentModel.init() {
    return StudentModel(
      id: 0,
      name: '',
      phone: '',
      photo: '',
      status: '',
      course: CourseModelModel.init(),
    );
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);
}
