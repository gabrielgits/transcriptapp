import '../models/config_model.dart';

abstract class RepositoryLocalHome {
  Future<ConfigModel> getConfig(int id);
  Future<int> updateConfig(ConfigModel config);
  Future<int> saveConfig(ConfigModel config);
}
