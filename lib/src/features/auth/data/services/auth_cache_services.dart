import 'package:transcriptapp/src/shared/datasources/sharedpref_datasource.dart';

class AuthCacheServices {

  static const _keyConfig = 'config';

  final SharedPrefDatasource _sharedPrefDatasource;

  AuthCacheServices(this._sharedPrefDatasource);


  Future<bool> logout() async {
    return await updateLoginConfig(
      token: '',
      studentId: 0,
      name: '',
    );
  }

  Future<bool> updateLoginConfig({
    required String token,
    required int studentId,
    required String name,
  }) async {
    var config = await _sharedPrefDatasource.getObject(_keyConfig);
    config['token'] = token;
    config['studentId'] = studentId;
    config['name'] = name;
    return await _sharedPrefDatasource.updateObject(item: config, key: _keyConfig);
  }
}
