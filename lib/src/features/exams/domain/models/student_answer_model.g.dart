// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentAnswerModelImpl _$$StudentAnswerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentAnswerModelImpl(
      id: (json['id'] as num).toInt(),
      student: StudentModel.fromJson(json['student'] as Map<String, dynamic>),
      question:
          QuestionModel.fromJson(json['question'] as Map<String, dynamic>),
      answer: AnswerModel.fromJson(json['answer'] as Map<String, dynamic>),
      teste: TesteModel.fromJson(json['teste'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StudentAnswerModelImplToJson(
        _$StudentAnswerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student': instance.student,
      'question': instance.question,
      'answer': instance.answer,
      'teste': instance.teste,
    };
