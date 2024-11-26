import 'package:feds/feds.dart';

import '../../domain/models/config_model.dart';
import '../../domain/repositories/repository_local_home.dart';

class RepositoryLocalHomeImpl implements RepositoryLocalHome {
  final FedsLocal datasource;
  final table = 'configs';

  RepositoryLocalHomeImpl(this.datasource);

  @override
  Future<int> updateConfig(ConfigModel item) async {
    return await datasource.update(item: item.toJson(), table: table);
  }

  @override
  Future<ConfigModel> getConfig(int id) async {
    final data = await datasource.getItem(id: id, table: table);
    return ConfigModel.fromJson(data);
  }

  @override

  Future<int> saveConfig(ConfigModel config) async {
    return await datasource.save(item: config.toJson(), table: table);
  }
}
