import 'package:transcriptapp/src/shared/data/services/dio_client_service.dart';
import 'package:transcriptapp/src/shared/data/services/sharedpref_service.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/config_model.dart';
import 'config_repository.dart';

class ConfigRepositoryLocal implements ConfigRepository {
  final SharedPrefService sharedPrefService;
  final DioClientService dioClientService;

  ConfigRepositoryLocal(
      {required this.sharedPrefService, required this.dioClientService});

  @override
  Future<Result<ConfigModel>> getConfig() async {
    try {
      final data = await sharedPrefService.getConfig();
      dioClientService.setToken(data['token']);
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
      final data = await sharedPrefService.saveConfig(config.toJson());
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
      final data = await sharedPrefService.updateConfig(config.toJson());
      return Result.ok(data ? config.id : 0);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
