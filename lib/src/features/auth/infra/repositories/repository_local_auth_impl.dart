import 'package:feds/feds.dart';
import '../../domain/repositories/repository_local_auth.dart';

class RepositoryLocalAuthImpl implements RepositoryLocalAuth {
  final FedsLocal datasource;
  final table = 'configs';

  RepositoryLocalAuthImpl(this.datasource);

  @override
  Future<int> deleteConfigStudent() async {
    var data = await datasource.getItem(id: 1, table: table);
    data['studentId'] = 0;
    data['token'] = '';
    return await datasource.update(item: data, table: table);
  }

  @override
  Future<int> updateConfigStudent({
    required int studentId,
    required String token,
  }) async {
    var data = await datasource.getItem(id: 1, table: table);
    data['studentId'] = studentId;
    data['token'] = token;
    return await datasource.update(item: data, table: table);
  }
}
