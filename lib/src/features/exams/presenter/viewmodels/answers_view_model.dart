import 'package:bform/bform.dart';

import '../../domain/models/answer_model.dart';

class AnswerViewModel implements BformObj {
  final AnswerModel model;
  final int questionId;

  AnswerViewModel({required this.model, required this.questionId});

  @override
  int get id => model.id;

  @override
  String get imagePath => 'assets/images/icons/app_icon.png';

  @override
  bool isSame(BformObj value) => id == value.id;

  @override
  String get subtitle => '${model.id}: ${model.answer}';

  @override
  String get title => model.answer;

  @override
  String toString() => title;
}
