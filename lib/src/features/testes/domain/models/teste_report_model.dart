import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:transcriptapp/src/features/testes/domain/models/teste_model.dart';

part 'teste_report_model.freezed.dart';
part 'teste_report_model.g.dart';

@freezed
class TesteReportModel with _$TesteReportModel {
  const factory TesteReportModel({
    required double average,
    required List<TesteModel> testes,
    attributes
  }) = _TesteReportModel;

  factory TesteReportModel.init() {
    return const TesteReportModel(
      average: 0,
      testes: [],
    );
  }

  factory TesteReportModel.fromJson(Map<String, Object?> json) =>
      _$TesteReportModelFromJson(json);
}
