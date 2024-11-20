import '../models/notification_model.dart';

/// An abstract class that defines the contract for a remote repository of Notification items.
/// This repository provides methods for CRUD operations on Notification items over a network.
abstract class RepositoryRemoteNotifications {
  /// Retrieves a list of all [NotificationModel] items from the remote source.
  ///
  /// - Returns a [Future] that completes with a list of [NotificationModel] items.
  /// - Throws an exception if the network request fails.
  Future<List<NotificationModel>> getList();

  /// Retrieves a [NotificationModel] item by its [id] from the remote source.
  ///
  /// - Returns a [Future] that completes with the [NotificationModel] item.
  /// - Throws an exception if the item is not found or the network request fails.
  Future<NotificationModel> getItem(int id);

  /// Posts a new [NotificationModel] item to the remote source.
  ///
  /// [jsonData] is a map containing the data to be posted.
  ///
  /// - Returns a [Future] that completes with the created [NotificationModel] item.
  /// - Throws an exception if the network request fails.
  Future<NotificationModel> postItem(Map<String, dynamic> jsonData);

  /// Updates an existing [NotificationModel] item on the remote source.
  ///
  /// [id] is the identifier for the item to be updated.
  /// [jsonData] is a map containing the updated data.
  ///
  /// - Returns a [Future] that completes with the updated [NotificationModel] item.
  /// - Throws an exception if the item is not found or the network request fails.
  Future<NotificationModel> putItem({
    required int id,
    required Map<String, dynamic> jsonData,
  });

  /// Deletes a [NotificationModel] item by its [id] from the remote source.
  ///
  /// [id] is the identifier for the item to be deleted.
  ///
  /// Returns a [Future] that completes with the deleted [NotificationModel] item.
  /// Throws an exception if the item is not found or the network request fails.
  Future<int> deleteItem(int id);
}
