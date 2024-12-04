import 'package:expt/expt.dart';

import '../models/teste_model.dart';
import '../repositories/repository_remote_exams.dart';

class UsecaseTestes {
  final RepositoryRemoteExams repositoryRemote;

  UsecaseTestes(this.repositoryRemote);

  Future<({List<TesteModel> testes, ExptWeb exptWeb})> fetchTestes(
      int studentId) async {
    try {
      final resultWeb = await repositoryRemote.getListTestes(studentId);
      if (resultWeb['status'] == false) {
        return (
          testes: List<TesteModel>.empty(),
          exptWeb: ExptWebGet(
              'Problem to get testes list: ${resultWeb['message']}', 1),
        );
      }

      List<TesteModel> testes = [];
      for (var testeJson in resultWeb['data']) {
        testes.add(TesteModel.fromJson(testeJson));
      }
      return (testes: testes, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        testes: List<TesteModel>.empty(),
        exptWeb: ExptWebUnknown('Error on get testes: ${e.toString()}', 3),
      );
    }
  }

  Future<({Map<String, dynamic> testeReport, ExptWeb exptWeb})>
      fetchReportTestes(int studentId) async {
    try {
      final resultWeb = await repositoryRemote.getTesteReport(
        studentId: studentId,
        limit: 3,
      );
      if (resultWeb['status'] == false) {
        return (
          testeReport: {
            'average': 0,
            'testes': List<TesteModel>.empty(),
          },
          exptWeb: ExptWebGet(
              'Problem to get teste Report: ${resultWeb["message"]}', 1),
        );
      }
      var testeReport = <String, dynamic>{};
      testeReport['average'] = resultWeb['data']['average'];
      List<TesteModel> testes = [];
      for (var testeJson in resultWeb['data']['testes']) {
        testes.add(TesteModel.fromJson(testeJson));
      }
      testeReport['testes'] = testes;
      return (testeReport: testeReport, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        testeReport: {
          'average': 0,
          'testes': List<TesteModel>.empty(),
        },
        exptWeb: ExptWebUnknown('Error on get testes: ${e.toString()}', 3),
      );
    }
  }

  Future<({TesteModel teste, ExptWeb exptWeb})> fetchTesteDetails(
      int id) async {
    try {
      final resultWeb = await repositoryRemote.getItemTeste(id);
      if (resultWeb['status'] == false) {
        return (
          teste: TesteModel.init(),
          exptWeb:
              ExptWebGet('Problem to get teste: ${resultWeb["message"]}', 1),
        );
      }
      TesteModel teste = TesteModel.fromJson(resultWeb['data']);
      return (teste: teste, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        teste: TesteModel.init(),
        exptWeb: ExptWebUnknown('Error on get teste: ${e.toString()}', 3),
      );
    }
  }

  Future<({TesteModel teste, ExptWeb exptWeb})> updateTeste({
    required int id,
    required TesteModel newTeste,
  }) async {
    try {
      final resultWeb =
          await repositoryRemote.putTeste(id: id, json: newTeste.toJson());
      if (resultWeb['status'] == false) {
        return (
          teste: TesteModel.init(),
          exptWeb: ExptWebPost(
              'Problem to update teste: ${resultWeb["message"]}', 1),
        );
      }

      TesteModel teste = TesteModel.fromJson(resultWeb['data']);
      return (teste: teste, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        teste: TesteModel.init(),
        exptWeb: ExptWebUnknown('Error on update teste: ${e.toString()}', 3),
      );
    }
  }
}
