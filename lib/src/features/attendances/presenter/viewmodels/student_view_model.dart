import 'package:bform/bform.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';


class StudentViewModel implements BformObj {
  final StudentModel model;

  const StudentViewModel(this.model);

  @override
  int get id {
    return model.id;
  }

  @override
  String get imagePath => model.photo;

  @override
  bool isSame(BformObj value) => id == value.id;

  @override
  String get subtitle => model.phone;

  @override
  String get title => model.name;
}
