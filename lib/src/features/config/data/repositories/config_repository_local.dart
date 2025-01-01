import 'package:transcriptapp/src/core/constants.dart';
import 'package:transcriptapp/src/shared/datasources/dio_datasource.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/config_model.dart';
import '../services/config_cache_services.dart';
import 'config_repository.dart';

class ConfigRepositoryLocal implements ConfigRepository {
  final ConfigCacheServices _configCacheServices;

  ConfigRepositoryLocal(
      {required ConfigCacheServices configCacheServices,
      required DioDatasource dioClientService})
      : _configCacheServices = configCacheServices;

  @override
  Future<Result<ConfigModel>> getConfig() async {
    try {
      final data = await _configCacheServices.getConfig();
      AppConstants.updatedUserToken = data['token'];
      return Result.ok(ConfigModel.fromJson(data));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<ConfigModel>> saveConfig() async {
    try {
      const config = ConfigModel(
        id: 1,
        studentId: 0,
        name: '',
        token: '',
        language: 'en',
      );
      final data = await _configCacheServices.saveConfig(config.toJson());
      if (!data) {
        return Result.error(Exception('Failed to save item'));
      }
      return const Result.ok(config);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<int>> updateConfig(ConfigModel config) async {
    try {
      final data = await _configCacheServices.updateConfig(config.toJson());
      return Result.ok(data ? config.id : 0);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
