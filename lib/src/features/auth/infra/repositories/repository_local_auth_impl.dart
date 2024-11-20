import 'package:feds/feds.dart';

import '../../domain/models/student_model.dart';
import '../../domain/repositories/repository_local_auth.dart';

class RepositoryLocalAuthImpl implements RepositoryLocalAuth {
  final FedsLocal datasource;
  final table = 'students';

  RepositoryLocalAuthImpl(this.datasource);

  @override
  Future<int> updateItem(StudentModel item) async {
    return await datasource.update(item: item.toJson(), table: table);
  }

  @override
  Future<int> saveItem(StudentModel item) async {
    await datasource.save(item: item.toJson(), table: table);
    return 1;
  }

  @override
  Future<int> deleteItem(int id) async {
    await datasource.delete(table: table, id: id);
    return 1;
  }

  @override
  Future<StudentModel> getItem(int id) async {
    final data = await datasource.getItem(id: id, table: table);
    return StudentModel.fromJson(data);
  }

  @override
  Future<int> updateStudentIdConfig(int id) async {
    const tableConfig = 'configs';
    Map<String, dynamic> data = await datasource.getItem(
      id: id,
      table: tableConfig,
    );
    data['studentId'] = id;
    return await datasource.update(item: data, table: tableConfig);
  }
}
