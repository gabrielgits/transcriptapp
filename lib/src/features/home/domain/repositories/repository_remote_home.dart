import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';
import 'package:transcriptapp/src/features/exams/domain/models/exam_model.dart';


abstract class RepositoryRemoteHome {
  /// Retrieves a list of all [ExamModel] items from the remote source.
  ///
  /// - Returns a [Future] that completes with a list of [ExamModel] items.
  /// - Throws an exception if the network request fails.
  Future<List<ExamModel>> getMyGames(List<String> gamesId);

  /// Retrieves a [ExamModel] item by its [id] from the remote source.
  ///
  /// - Returns a [Future] that completes with the [ExamModel] item.
  /// - Throws an exception if the item is not found or the network request fails.
  Future<ExamModel> getItem(int id);

  /// Posts a new [ExamModel] item to the remote source.
  ///
  /// [jsonData] is a map containing the data to be posted.
  ///
  /// - Returns a [Future] that completes with the created [ExamModel] item.
  /// - Throws an exception if the network request fails.
  Future<ExamModel> postItem(Map<String, dynamic> jsonData);

  /// Updates an existing [ExamModel] item on the remote source.
  ///
  /// [id] is the identifier for the item to be updated.
  /// [jsonData] is a map containing the updated data.
  ///
  /// - Returns a [Future] that completes with the updated [ExamModel] item.
  /// - Throws an exception if the item is not found or the network request fails.
  Future<ExamModel> putItem({
    required int id,
    required Map<String, dynamic> jsonData,
  });

  /// Deletes a [ExamModel] item by its [id] from the remote source.
  ///
  /// Returns a [Future] that completes with the deleted [ExamModel] item.
  /// Throws an exception if the item is not found or the network request fails.
  Future<void> deleteItem(int id);

  Future<StudentModel> getUser(String userId);
}
