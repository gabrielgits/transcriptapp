// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentAnswerModelImpl _$$StudentAnswerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentAnswerModelImpl(
      id: (json['id'] as num).toInt(),
      studentId: (json['studentId'] as num).toInt(),
      question:
          QuestionModel.fromJson(json['question'] as Map<String, dynamic>),
      answer: AnswerModel.fromJson(json['answer'] as Map<String, dynamic>),
      testeId: (json['testeId'] as num).toInt(),
    );

Map<String, dynamic> _$$StudentAnswerModelImplToJson(
        _$StudentAnswerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'question': instance.question,
      'answer': instance.answer,
      'testeId': instance.testeId,
    };
