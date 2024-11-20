// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerModelImpl _$$AnswerModelImplFromJson(Map<String, dynamic> json) =>
    _$AnswerModelImpl(
      id: (json['id'] as num).toInt(),
      line: json['line'] as String,
      answer: json['answer'] as String,
      questionId: (json['questionId'] as num).toInt(),
    );

Map<String, dynamic> _$$AnswerModelImplToJson(_$AnswerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'line': instance.line,
      'answer': instance.answer,
      'questionId': instance.questionId,
    };
