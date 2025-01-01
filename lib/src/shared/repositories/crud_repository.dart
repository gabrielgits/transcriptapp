import 'package:transcriptapp/src/utils/result.dart';

/// An abstract class that defines CRUD operations for a repository.
mixin CrudRepository<T> {

  /// Retrieves all items from the repository.
  ///
  /// Returns a [Future] containing a [Result] with a list of items of type [T].
  Future<Result<List<T>>> getAllItems();

  /// Retrieves a specific item from the repository by its [idItem].
  ///
  /// Returns a [Future] containing a [Result] with the item of type [T].
  Future<Result<T>> getItem(int idItem);

  /// Creates a new item in the repository.
  ///
  /// Takes an [item] of type [T] to be created.
  /// Returns a [Future] containing a [Result] with the created item of type [T].
  Future<Result<T>> createItem(T item);

  /// Updates an existing item in the repository.
  ///
  /// Takes an [id] which is the identifier of the item and a [json] map representing the updated data.
  /// Returns a [Future] containing a [Result] with the updated item of type [T].
  Future<Result<T>> updateItem({
    required int id,
    required Map<String, dynamic> json,
  });

  /// Deletes a specific item from the repository by its [idItem].
  ///
  /// Returns a [Future] containing a [Result] with the deleted item of type [T].
  Future<Result<T>> deleteItem(int idItem);

  /// Filters items in the repository based on the provided [filters].
  ///
  /// Takes a [filters] map representing the criteria for filtering.
  /// Returns a [Future] containing a [Result] with a list of items of type [T] that match the filters.
  Future<Result<List<T>>> customGetItems(Map<String, dynamic> filters);
}
