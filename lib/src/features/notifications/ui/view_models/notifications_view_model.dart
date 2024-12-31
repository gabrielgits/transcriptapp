import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transcriptapp/src/features/config/ui/view_models/config_view_model.dart';
import 'package:transcriptapp/src/shared/datasources/dio_datasource.dart';
import 'package:transcriptapp/src/shared/datasources/sharedpref_datasource.dart';
import 'package:transcriptapp/src/shared/repositories/crud_repository_cached.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../../domain/models/notification_model.dart';

part 'notifications_view_model.g.dart';

class _NotificationsRepository
    extends CrudRepositoryCached<NotificationModel> {
  _NotificationsRepository()
      : super(
          remoteDatasource: DioDatasource(),
          localDatasource: SharedPrefDatasource(),
          table: 'notifications',
          fromJson: NotificationModel.fromJson,
        );
}


@riverpod
Future<List<NotificationModel>> getAllNotificationsViewModel(Ref ref) async {
  final repository = _NotificationsRepository();
  final studentId = ref.watch(configViewModelProvider).value!.studentId;
  final result = await repository.filterItems({
    'student': studentId,
    'classe': 1,
  });
  ();
  switch (result) {
    case Error<List<NotificationModel>>():
      throw Exception(result.error);
    case Ok<List<NotificationModel>>():
  }
  return result.value;
}

@riverpod
Future<NotificationModel> getNotificationViewModel(Ref ref, int id) async {
  final repository = _NotificationsRepository();
  final result = await repository.getItem(id);
  switch (result) {
    case Error<NotificationModel>():
      throw Exception(result.error);
    case Ok<NotificationModel>():
  }
  return result.value;
}

@riverpod
Future<NotificationModel> deleteNotificationViewModel(Ref ref, int id) async {
  final repository = _NotificationsRepository();
  final result = await repository.deleteItem(id);
  switch (result) {
    case Error<NotificationModel>():
      throw Exception(result.error);
    case Ok<NotificationModel>():
  }
  return result.value;
}

@riverpod
Future<NotificationModel> createNotificationViewModel(
    Ref ref, NotificationModel notification) async {
  final repository = _NotificationsRepository();
  final result = await repository.createItem(notification);
  switch (result) {
    case Error<NotificationModel>():
      throw Exception(result.error);
    case Ok<NotificationModel>():
  }
  return result.value;
}

@riverpod
Future<NotificationModel> updateNotificationViewModel(
    Ref ref, NotificationModel notification) async {
  final repository = _NotificationsRepository();
  final result = await repository.updateItem(
      id: notification.id, json: notification.toJson());
  switch (result) {
    case Error<NotificationModel>():
      throw Exception(result.error);
    case Ok<NotificationModel>():
  }
  return result.value;
}
