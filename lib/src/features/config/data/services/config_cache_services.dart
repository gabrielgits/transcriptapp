import 'package:transcriptapp/src/shared/datasources/sharedpref_datasource.dart';

class ConfigCacheServices {
    final SharedPrefDatasource _sharedPrefDatasource;

    ConfigCacheServices(this._sharedPrefDatasource);

    final String _keyConfig = 'config';

    Future<bool> saveConfig(Map<String, dynamic> json) async =>
      await _sharedPrefDatasource.saveObject(item: json, key: _keyConfig);

  Future<Map<String, dynamic>> getConfig() async =>
      await _sharedPrefDatasource.getObject(_keyConfig);

  Future<bool> updateConfig(Map<String, dynamic> json) async =>
      await _sharedPrefDatasource.updateObject(item: json, key: _keyConfig);

  Future<bool> removeConfig() async => await _sharedPrefDatasource.deleteAll(_keyConfig);


}