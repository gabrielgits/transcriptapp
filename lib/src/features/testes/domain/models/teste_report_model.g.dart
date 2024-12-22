// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teste_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TesteReportModelImpl _$$TesteReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TesteReportModelImpl(
      average: (json['average'] as num).toDouble(),
      testes: (json['testes'] as List<dynamic>)
          .map((e) => TesteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributes: json['attributes'],
    );

Map<String, dynamic> _$$TesteReportModelImplToJson(
        _$TesteReportModelImpl instance) =>
    <String, dynamic>{
      'average': instance.average,
      'testes': instance.testes,
      'attributes': instance.attributes,
    };
