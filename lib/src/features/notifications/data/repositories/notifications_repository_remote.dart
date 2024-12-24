import 'package:transcriptapp/src/shared/data/services/dio_client_service.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/notification_model.dart';
import 'notifications_repository.dart';

class NotificationsRepositoryRemote
    implements NotificationsRepository {
  final DioClientService dioClientService;
  const NotificationsRepositoryRemote(this.dioClientService);

  @override
  Future<Result<List<NotificationModel>>> getList() async {
    try {
      final data = await dioClientService.getNotifications();
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      List<NotificationModel> notifications = [];
      for (var notificationJson in data['data']) {
        notifications.add(NotificationModel.fromJson(notificationJson));
      }
      return Result.ok(notifications);
    } on Exception catch (e) {
      return Result.error(e);
    }

  }

  @override
  Future<Result<NotificationModel>> getItem(int id) async {
    try {
      final data = await dioClientService.getNotification(id);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(NotificationModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override

  Future<Result<NotificationModel>> saveItem(Map<String, dynamic> jsonData) async {
    try {
      final data = await dioClientService.postNotification(jsonData);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(NotificationModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }

  }

  @override
  Future<Result<int>> deleteItem(int id) async {
    try {
      final data = await dioClientService.deleteNotification(id);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(data['data']);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<NotificationModel>> updateItem({
    required int id,
    required Map<String, dynamic> jsonData,
  }) async {
    try {
      final data = await dioClientService.putNotification(id: id, json: jsonData);
      if (data['status'] == false) {
        return Result.error(Exception(data['message']));
      }
      return Result.ok(NotificationModel.fromJson(data['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
