import '../models/notification_model.dart';

/// An abstract class that defines the contract for a local repository of Notification items.
/// This repository provides methods for CRUD operations on Notification items and lists.
abstract class RepositoryLocalNotifications {
  /// Retrieves a [NotificationModel] item by its [id].
  ///
  /// - Returns a [Future] that completes with the [NotificationModel] item.
  /// - Returns a empty [NotificationModel] with ID == 0.
  Future<NotificationModel> getItem(int id);

  /// Saves a [NotificationModel] item to the repository.
  ///
  /// - Returns a [Future] that completes with the ID of the saved item.
  /// - Returns 0 if not saved.
  Future<int> saveItem(NotificationModel item);

  /// Updates a [NotificationModel] item in the repository.
  ///
  /// - Returns a [Future] that completes with the ID of the updated item.
  /// - Returns 0 if not updated.
  Future<int> updateItem(NotificationModel item);

  /// Deletes a [NotificationModel] item by its [id].
  ///
  /// - Returns a [Future] that completes with the ID of the updated item.
  /// - Returns 0 if not deleted.
  Future<int> deleteItem(int id);

  /// Retrieves a list of all [NotificationModel] items.
  ///
  /// - Returns a [Future] that completes with a list of [NotificationModel] items.
  /// - Returns an empty list if not found.
  Future<List<NotificationModel>> getList();

  /// Saves a list of [NotificationModel] items to the repository.
  ///
  /// - Returns a [Future] that completes with the number of items saved.
  Future<int> saveList(List<NotificationModel> list);

  /// Updates a list of [NotificationModel] items in the repository.
  ///
  /// - Returns a [Future] that completes with the number of items updated.
  Future<int> updateList(List<NotificationModel> list);

  /// Deletes all [NotificationModel] items from the repository.
  ///
  /// - Returns a [Future] that completes with the number of rows affected.
  Future<int> deleteAll();
}
