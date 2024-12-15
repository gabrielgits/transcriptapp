import 'package:expt/expt.dart';
import 'package:transcriptapp/src/config/constants.dart';

import '../models/config_model.dart';
import '../repositories/repository_local_home.dart';

class UsecaseConfigs {
  final RepositoryLocalHome repositoryLocal;

  UsecaseConfigs(this.repositoryLocal);

  /// Updates a Config item in the local repository.
  ///
  /// [updateItem] is the item to be updated.
  ///
  /// Returns a [Future] that completes with a tuple containing:
  /// - [ExptData] indicating the status of the operation.
  /// - The updated [ConfigModel] item.
  Future<({ExptData exception, ConfigModel item})> updateConfig(
      ConfigModel updateItem) async {
    try {
      final idSaved = await repositoryLocal.updateConfig(updateItem);
      if (idSaved > 0) {
        return (exception: ExptDataNoExpt(), item: updateItem);
      }
      return (
        exception: ExptDataSave('Error save item', 1),
        item: ConfigModel.init()
      );
    } catch (e) {
      return (
        exception: ExptDataUnknown(e.toString()),
        item: ConfigModel.init()
      );
    }
  }

  /// Loads a single Config by its ID from the local repository.
  ///
  /// Returns a [Future] that completes with the [ConfigModel] item.
  Future<({ExptData exception, ConfigModel item})> loadConfig() async {
    try {
      final item = await repositoryLocal.getConfig(1);
      if (item.id != 0) {
        AppConstants.token = item.token;
        return (
          exception: ExptDataNoExpt(),
          item: item,
        );
      } else {
        return (
          exception: ExptDataLoad('Item not found', 1),
          item: ConfigModel.init(),
        );
      }
    } catch (e) {
      return (
        exception: ExptDataUnknown(e.toString(), 1),
        item: ConfigModel.init(),
      );
    }
  }

  Future<({ExptData exception, int id})> saveConfig(ConfigModel config) async {
    try {
      final idSaved = await repositoryLocal.saveConfig(config);
      if (idSaved > 0) {
        return (exception: ExptDataNoExpt(), id: idSaved);
      }
      return (
        exception: ExptDataSave('Error save item', 1),
        id: 0,
      );
    } catch (e) {
      return (
        exception: ExptDataUnknown(e.toString(), 2),
        id: 0,
      );
    }
  }
}
