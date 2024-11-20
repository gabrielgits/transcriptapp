// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionModelImpl _$$QuestionModelImplFromJson(Map<String, dynamic> json) =>
    _$QuestionModelImpl(
      id: (json['id'] as num).toInt(),
      question: json['question'] as String,
      correctLine: json['correctLine'] as String,
      answer: (json['answer'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      examId: (json['examId'] as num).toInt(),
      answerId: (json['answerId'] as num).toInt(),
    );

Map<String, dynamic> _$$QuestionModelImplToJson(_$QuestionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'correctLine': instance.correctLine,
      'answer': instance.answer,
      'examId': instance.examId,
      'answerId': instance.answerId,
    };
