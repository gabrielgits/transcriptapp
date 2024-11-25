import 'package:expt/expt.dart';

import '../models/notification_model.dart';
import '../repositories/repository_local_notifications.dart';
import '../repositories/repository_remote_notifications.dart';

/// A use case class for managing operations related to Notifications.
/// It interacts with both local and remote repositories to perform
/// CRUD operations and handle data fetching, saving, and updating.
class UsecaseNotifications {
  final RepositoryRemoteNotifications repositoryRemote;
  final RepositoryLocalNotifications repositoryLocal;

  UsecaseNotifications({
    required this.repositoryRemote,
    required this.repositoryLocal,
  });

  /// Fetches a list of Notifications from the remote repository and saves them to the local repository.
  ///
  /// Returns a [Future] that completes with a tuple containing:
  /// - [ExptData] indicating the status of the local operation.
  /// - [ExptWeb] indicating the status of the remote operation.
  Future<({ExptData exptData, ExptWeb exptWeb})> fetchNotifications() async {
    final resultWeb = await repositoryRemote.getList();

    if (resultWeb.isEmpty) {
      return (
        exptData: ExptDataNoExpt(),
        exptWeb: ExptWebGet('Empty remote data', 1)
      );
    }
    final resultLocal = await repositoryLocal.saveList(resultWeb);
    if (resultLocal == 0) {
      return (
        exptWeb: ExptWebNoExpt(),
        exptData: ExptDataLoad('No local data save', 2)
      );
    }
    return (exptData: ExptDataNoExpt(), exptWeb: ExptWebNoExpt());
  }

  /// Loads a list of Notifications from the local repository.
  ///
  /// Returns a [Future] that completes with a tuple containing:
  /// - [ExptData] indicating the status of the operation.
  /// - A list of [NotificationModel] items.
  Future<({ExptData exception, List<NotificationModel> list})>
      loadNotifications() async {
    try {
      final items = await repositoryLocal.getList();
      if (items.isNotEmpty) {
        return (
          exception: ExptDataNoExpt(),
          list: items,
        );
      }
      return (
        exception: ExptDataLoad('Empty local data', 1),
        list: List<NotificationModel>.empty(),
      );
    } catch (e) {
      return (
        exception: ExptDataUnknown(e.toString(), 1),
        list: List<NotificationModel>.empty(),
      );
    }
  }

  /// Updates a Notification item in the local repository.
  ///
  /// [updateItem] is the item to be updated.
  ///
  /// Returns a [Future] that completes with a tuple containing:
  /// - [ExptData] indicating the status of the operation.
  /// - The updated [NotificationModel] item.
  Future<({ExptData exception, NotificationModel item})> updateNotification(
      NotificationModel updateItem) async {
    try {
      final idSaved = await repositoryLocal.updateItem(updateItem);
      if (idSaved > 0) {
        return (exception: ExptDataNoExpt(), item: updateItem);
      }
      return (
        exception: ExptDataSave('Error save item'),
        item: NotificationModel.init()
      );
    } catch (e) {
      return (
        exception: ExptDataUnknown(e.toString()),
        item: NotificationModel.init()
      );
    }
  }

  /// Loads a single Notification by its ID from the local repository.
  ///
  /// Returns a [Future] that completes with the [NotificationModel] item.
  Future<({ExptData exception, NotificationModel item})> loadNotification(
      int id) async {
    try {
      final item = await repositoryLocal.getItem(id);
      if (item.id != 0) {
        return (
          exception: ExptDataNoExpt(),
          item: item,
        );
      } else {
        return (
          exception: ExptDataLoad('Item not found', 1),
          item: NotificationModel.init(),
        );
      }
    } catch (e) {
      return (
        exception: ExptDataUnknown(e.toString(), 1),
        item: NotificationModel.init(),
      );
    }
  }

  /// Creates a new Notification in the local repository.
  ///
  /// Returns a [Future] that completes with the ID of the created item.
  Future<({ExptData exception, int id})> createNotification(
      NotificationModel item) async {
    try {
      final id = await repositoryLocal.saveItem(item);
      if (id != 0) {
        return (
          exception: ExptDataNoExpt(),
          id: id,
        );
      } else {
        return (
          exception: ExptDataSave('Item not saved', 1),
          id: 0,
        );
      }
    } catch (e) {
      return (
        exception: ExptDataUnknown(e.toString(), 1),
        id: 0,
      );
    }
  }

  /// Removes a single Notification by its ID from the local repository.
  ///
  /// Returns a [Future] that completes with the ID of the removed item.
  Future<({ExptData exception, int id})> removeNotification(int id) async {
    try {
      final deletedId = await repositoryLocal.deleteItem(id);
      if (deletedId != 0) {
        return (
          exception: ExptDataNoExpt(),
          id: deletedId,
        );
      } else {
        return (
          exception: ExptDataDelete('Item not deleted', 1),
          id: 0,
        );
      }
    } catch (e) {
      return (
        exception: ExptDataUnknown(e.toString(), 1),
        id: 0,
      );
    }
  }

  /// Removes all Notifications from the local repository.
  ///
  /// Returns a [Future] that completes with the number of removed items.
  Future<({ExptData exception, int count})> removeAllNotifications() async {
    try {
      final count = await repositoryLocal.deleteAll();
      return (
        exception: ExptDataNoExpt(),
        count: count,
      );
    } catch (e) {
      return (
        exception: ExptDataUnknown(e.toString(), 1),
        count: 0,
      );
    }
  }

  /// Fetches a Notification item by its [id] from the remote repository and saves it to the local repository.
  ///
  /// Returns a [Future] that completes with a tuple containing:
  /// - [ExptData] indicating the status of the local operation.
  /// - [ExptWeb] indicating the status of the remote operation.
  Future<({ExptData exptData, ExptWeb exptWeb})> fetchNotification(
      int id) async {
    try {
      final itemWeb = await repositoryRemote.getItem(id);
      int idSaved = await repositoryLocal.saveItem(itemWeb);
      if (idSaved > 0) {
        return (exptData: ExptDataNoExpt(), exptWeb: ExptWebNoExpt());
      }
      return (
        exptData: ExptDataSave('Error save item', 1),
        exptWeb: ExptWebNoExpt(),
      );
    } catch (e) {
      return (exptData: ExptDataUnknown(e.toString(), 3), exptWeb: ExptWebUnknown(e.toString(), 2));
    }
  }

  /// Sends a Notification item to the remote repository to be updated.
  ///
  /// [updateItem] is the item to be sent.
  ///
  /// Returns a [Future] that completes with a tuple containing:
  /// - [ExptWeb] indicating the status of the operation.
  /// - The updated [NotificationModel] item.
  Future<({ExptWeb exception, NotificationModel item})> sendNotification(
      NotificationModel updateItem) async {
    try {
      final itemUpdated = await repositoryRemote.putItem(
        id: updateItem.id,
        jsonData: updateItem.toJson(),
      );

      return (
        exception: ExptWebNoExpt(),
        item: itemUpdated,
      );
    } catch (e) {
      return (
        exception: ExptWebUnknown(e.toString(), 1),
        item: NotificationModel.init(),
      );
    }
  }

  /// Receives all Notification items from the remote repository.
  ///
  /// Returns a [Future] that completes with a tuple containing:
  /// - [ExptWeb] indicating the status of the operation.
  /// - A list of [NotificationModel] items.
  Future<({ExptWeb exception, List<NotificationModel> list})>
      receiveAllNotifications() async {
    try {
      final list = await repositoryRemote.getList();
      if (list.isNotEmpty) {
        return (
          exception: ExptWebNoExpt(),
          list: list,
        );
      }
      return (
        exception: ExptWebGet('Empty remote data', 1),
        list: List<NotificationModel>.empty(),
      );
    } catch (e) {
      return (
        exception: ExptWebUnknown(e.toString(), 1),
        list: List<NotificationModel>.empty(),
      );
    }
  }

  /// Receives a Notification item by its [id] from the remote repository.
  ///
  /// Returns a [Future] that completes with a tuple containing:
  /// - [ExptWeb] indicating the status of the operation.
  /// - The received [NotificationModel] item.
  Future<({ExptWeb exception, NotificationModel item})> receiveNotification(
      int id) async {
    try {
      final item = await repositoryRemote.getItem(id);

      return (
        exception: ExptWebNoExpt(),
        item: item,
      );
    } catch (e) {
      return (
        exception: ExptWebUnknown(e.toString(), 1),
        item: NotificationModel.init(),
      );
    }
  }
}
