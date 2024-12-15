import 'package:feds/feds.dart';
import 'package:transcriptapp/src/config/constants.dart';

import '../../domain/models/notification_model.dart';
import '../../domain/repositories/repository_remote_notifications.dart';

class RepositoryRemoteNotificationsImpl
    implements RepositoryRemoteNotifications {
  final String table = 'notifications';
  final FedsRest datasource;
  RepositoryRemoteNotificationsImpl(this.datasource);

  @override
  Future<List<NotificationModel>> getList() async {
    final response = await datasource.get(
      '${AppConstants.urlApi}/$table/',
      token: AppConstants.token,
    );
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    List<NotificationModel> list = [];

    for (var item in response['data']) {
      list.add(NotificationModel.fromJson(item));
    }
    return list;
  }

  @override
  Future<NotificationModel> getItem(int id) async {
    final response = await datasource.get(
      '${AppConstants.urlApi}/$table/$id',
      token: AppConstants.token,
    );
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    return NotificationModel.fromJson(response['data']);
  }

  @override
  Future<NotificationModel> postItem(Map<String, dynamic> jsonData) async {
    final response = await datasource.post(
      url: '${AppConstants.urlApi}/$table/',
      body: jsonData,
      token: AppConstants.token,
    );
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    return NotificationModel.fromJson(response['data']);
  }

  @override
  Future<int> deleteItem(int id) async {
    final response = await datasource.delete(
      '${AppConstants.urlApi}/$table/$id',
      token: AppConstants.token,
    );
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    return id;
  }

  @override
  Future<NotificationModel> putItem({
    required int id,
    required Map<String, dynamic> jsonData,
  }) async {
    final response =
        await datasource.put(url: '${AppConstants.urlApi}/$table/$id', body: jsonData, token: AppConstants.token);
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    return NotificationModel.fromJson(response['data']);
  }
}
