import 'package:expt/expt.dart';
import 'package:transcriptapp/src/features/exams/domain/models/exam_model.dart';

import '../repositories/repository_remote_home.dart';

/// A use case class for managing operations related to Exams.
/// It interacts with remote repositories to perform
/// CRUD operations and handle data fetching, saving, and updating.
class UsecaseExams {
  final RepositoryRemoteHome repositoryRemote;

  UsecaseExams(this.repositoryRemote);

  /// Removes a single Exam by its ID from the remote repository.
  ///
  /// Returns a [Future] that completes with the ID of the removed item.
  Future<({ExptData exception, int id})> removeExam(int id) async {
    try {
      await repositoryRemote.deleteItem(id);

      return (
        exception: ExptDataNoExpt(),
        id: id,
      );
    } catch (e) {
      return (
        exception: ExptDataDelete(e.toString(), 1),
        id: 0,
      );
    }
  }

  /// Sends a Exam item to the remote repository to be updated.
  ///
  /// [updateItem] is the item to be sent.
  ///
  /// Returns a [Future] that completes with a tuple containing:
  /// - [ExptWeb] indicating the status of the operation.
  /// - The updated [ExamModel] item.
  Future<({ExptWeb exception, ExamModel item})> sendExam(
      ExamModel updateItem) async {
    try {
      final itemUpdated = await repositoryRemote.putItem(
        id: updateItem.id,
        jsonData: updateItem.toJson(),
      );

      return (
        exception: ExptWebPost(),
        item: itemUpdated,
      );
    } catch (e) {
      return (
        exception: ExptWebGet(e.toString(), 1),
        item: ExamModel.init(),
      );
    }
  }

  /// Receives all Exam items from the remote repository.
  ///
  /// Returns a [Future] that completes with a tuple containing:
  /// - [ExptWeb] indicating the status of the operation.
  /// - A list of [ExamModel] items.
  Future<({ExptWeb exception, List<ExamModel> list})> fetchMyExams(
      String userId) async {
    try {
      final item = await repositoryRemote.getUser(userId);
      if (item.id > 0) {
        final list = await repositoryRemote.getMyGames([]);
        if (list.isEmpty) {
          return (
            exception: ExptWebNoExpt(),
            list: list,
          );
        }
      }

      return (
        exception: ExptWebGet('Empty remote data', 1),
        list: List<ExamModel>.empty(),
      );
    } catch (e) {
      return (
        exception: ExptWebGet(e.toString(), 1),
        list: List<ExamModel>.empty(),
      );
    }
  }

  /// Receives a Exam item by its [id] from the remote repository.
  ///
  /// Returns a [Future] that completes with a tuple containing:
  /// - [ExptWeb] indicating the status of the operation.
  /// - The received [ExamModel] item.
  Future<({ExptWeb exception, ExamModel item})> receiveExam(int id) async {
    try {
      final item = await repositoryRemote.getItem(id);

      return (
        exception: ExptWebPost(),
        item: item,
      );
    } catch (e) {
      return (
        exception: ExptWebGet(e.toString(), 1),
        item: ExamModel.init(),
      );
    }
  }
}
