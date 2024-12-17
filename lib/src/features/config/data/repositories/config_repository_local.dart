import 'package:transcriptapp/src/shared/data/services/sharedpref_service.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/config_model.dart';
import 'config_repository.dart';

class ConfigRepositoryLocal implements ConfigRepository {
  final SharedPrefService _sharedPrefSservice;

  ConfigRepositoryLocal(this._sharedPrefSservice);

  @override
  Future<Result<ConfigModel>> getConfig() async {
    try {
      final data = await _sharedPrefSservice.getConfig();
      return Result.ok(ConfigModel.fromJson(data));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<int>> saveConfig(ConfigModel config) async {
    try {
      final data = await _sharedPrefSservice.saveConfig(config.toJson());
      return Result.ok(data ? config.id : 0);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<int>> updateConfig(ConfigModel config) async {
    try {
      final data = await _sharedPrefSservice.updateConfig(config.toJson());
      return Result.ok(data ? config.id : 0);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
