import 'package:expt/expt.dart';

import '../models/teste_model.dart';
import '../repositories/repository_remote_exams.dart';

class UsecaseTestes {
  final RepositoryRemoteExams repositoryRemote;

  UsecaseTestes(this.repositoryRemote);

  Future<({List<TesteModel> testes, ExptWeb exptWeb})> fetchTestes(
      int studentId) async {
    try {
      final testes = await repositoryRemote.getListTestes(studentId);
      if (testes.isEmpty) {
        return (
          testes: List<TesteModel>.empty(),
          exptWeb: ExptWebPost('Empty testes list', 1),
        );
      }

      return (testes: testes, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        testes: List<TesteModel>.empty(),
        exptWeb: ExptWebUnknown('Error on get testes: ${e.toString()}', 3),
      );
    }
  }

  Future<({TesteModel teste, ExptWeb exptWeb})> fetchTesteDetails(int id) async {
    try {
      final teste = await repositoryRemote.getItemTeste(id);
      if (teste.id == 0) {
        return (
          teste: TesteModel.init(),
          exptWeb: ExptWebPost('Teste not found', 1),
        );
      }

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
      final teste = await repositoryRemote.putTeste(id: id, newTeste: newTeste);
      if (teste.id == 0) {
        return (
          teste: TesteModel.init(),
          exptWeb: ExptWebPost('Teste not updated', 1),
        );
      }

      return (teste: teste, exptWeb: ExptWebNoExpt());
    } catch (e) {
      return (
        teste: TesteModel.init(),
        exptWeb: ExptWebUnknown('Error on update teste: ${e.toString()}', 3),
      );
    }
  }

}
