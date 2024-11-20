import '../models/student_model.dart';

/// An abstract class that defines the contract for a local repository of Student items.
/// This repository provides methods for CRUD operations on Student items and lists.
abstract class RepositoryLocalAuth {
  /// Retrieves a [StudentModel] item by its [id].
  ///
  /// - Returns a [Future] that completes with the [StudentModel] item.
  /// - Returns a empty [StudentModel] with ID == 0.
  Future<StudentModel> getItem(int id);

  /// Saves a [StudentModel] item to the repository.
  ///
  /// - Returns a [Future] that completes with the ID of the saved item.
  /// - Returns 0 if not saved.
  Future<int> saveItem(StudentModel item);

  /// Updates a [StudentModel] item in the repository.
  ///
  /// - Returns a [Future] that completes with the ID of the updated item.
  /// - Returns 0 if not updated.
  Future<int> updateItem(StudentModel item);

  /// Deletes a [StudentModel] item by its [id].
  ///
  /// - Returns a [Future] that completes with the ID of the updated item.
  /// - Returns 0 if not deleted.
  Future<int> deleteItem(int id);

  Future<int> updateStudentIdConfig(int id);
}
