import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:transcriptapp/src/features/auth/domain/models/teacher_model.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

/*
"course": {
            "id": 1,
            "name": "Economia",
            "room": "A.01",
            "userId": 1,
            "user": {
                "id": 1,
                "name": "Admin do Sistema",
                "email": "admin@transcript.ao"
            }
        }
        */

@freezed
class CourseModelModel with _$CourseModelModel {
  const factory CourseModelModel({
    required int id,
    required String name,
    required String room,
    @JsonKey(name: 'user') required TeacherModel teacher,
  }) = _CourseModelModel;

  factory CourseModelModel.init() {
    return CourseModelModel(
      id: 0,
      name: '',
      room: '',
      teacher: TeacherModel.init(),
      
    );
  }

  factory CourseModelModel.fromJson(Map<String, Object?> json) =>
      _$CourseModelModelFromJson(json);
}
