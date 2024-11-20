import 'package:fecs/fecs.dart';

import '../../domain/models/notification_model.dart';
import '../../domain/repositories/repository_remote_notifications.dart';

class RepositoryRemoteNotificationsImpl
    implements RepositoryRemoteNotifications {
  final String table = 'notifications';
  final FecsData datasource;
  RepositoryRemoteNotificationsImpl(this.datasource);

  @override
  Future<List<NotificationModel>> getList() async {
    final response = await datasource.getAll(table);
    List<NotificationModel> list = [];
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    for (var item in response['data']) {
      list.add(NotificationModel.fromJson(item));
    }
    return list;
  }

  @override
  Future<NotificationModel> getItem(int id) async {
    final response = await datasource.get(table: table, id: id.toString());
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    return NotificationModel.fromJson(response['data']);
  }

  @override
  Future<NotificationModel> postItem(Map<String, dynamic> jsonData) async {
    final response = await datasource.post(table: table, body: jsonData);
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    return NotificationModel.fromJson(response['data']);
  }

  @override
  Future<int> deleteItem(int id) async {
    final response = await datasource.delete(id: id.toString(), table: table);

    return int.parse(response);
  }

  @override
  Future<NotificationModel> putItem({
    required int id,
    required Map<String, dynamic> jsonData,
  }) async {
    final response =
        await datasource.put(id: id.toString(), table: table, body: jsonData);
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    return NotificationModel.fromJson(response['data']);
  }
}
