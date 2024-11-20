import 'package:feds/feds.dart';

import '../../domain/models/notification_model.dart';
import '../../domain/repositories/repository_local_notifications.dart';

class RepositoryLocalNotificationsImpl implements RepositoryLocalNotifications {
  final FedsLocal datasource;
  final table = 'notifications';

  RepositoryLocalNotificationsImpl(this.datasource);

  @override
  Future<List<NotificationModel>> getList() async {
    List<NotificationModel> list = [];
    final datas = await datasource.getAll(table);
    if (datas.isEmpty) {
      return [];
    }
    for (final item in datas) {
      list.add(NotificationModel.fromJson(item));
    }
    return list;
  }

  @override
  Future<int> saveList(List<NotificationModel> list) async {
    if (list.isEmpty) {
      return 0;
    }
    await datasource.deleteAll(table);
    final listData = list.map((e) => e.toJson()).toList();
    return await datasource.saveAll(items: listData, table: table);
  }

  @override
  Future<int> updateItem(NotificationModel item) async {
    return await datasource.update(item: item.toJson(), table: table);
  }

  @override
  Future<int> saveItem(NotificationModel item) async {
    return await datasource.update(item: item.toJson(), table: table);
  }

  @override
  Future<int> deleteAll() async {
    return await datasource.deleteAll(table);
  }

  @override
  Future<int> deleteItem(int id) async {
    return await datasource.delete(table: table, id: id) as int;
  }

  @override
  Future<NotificationModel> getItem(int id) async {
    final data = await datasource.getItem(id: id, table: table);
    return NotificationModel.fromJson(data);
  }

  @override
  Future<int> updateList(List<NotificationModel> list) async {
    if (list.isEmpty) {
      return 0;
    }
    int quant = 0;
    for (final item in list) {
      final id = await datasource.update(item: item.toJson(), table: table);
      if (id > 0) {
        quant++;
      }
    }
    return quant;
  }
}
