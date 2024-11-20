import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fecs/fecs.dart';
import 'package:transcriptapp/src/features/auth/domain/models/student_model.dart';
import 'package:transcriptapp/src/features/exams/domain/models/exam_model.dart';

import '../../domain/repositories/repository_remote_home.dart';

class RepositoryRemoteHomeImpl implements RepositoryRemoteHome {
  final String name = 'games';
  final FecsData datasource;
  RepositoryRemoteHomeImpl(this.datasource);

  @override
  Future<List<ExamModel>> getMyGames(List<String> gamesId) async {
    final response = await datasource.searchAll(
      table: name,
      field: FieldPath.documentId,
      whereIn: gamesId,
    );
    List<ExamModel> list = [];
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    for (var item in response['data']) {
      list.add(ExamModel.fromJson(item));
    }
    return list;
  }

  @override
  Future<ExamModel> getItem(int id) async {
    final response = await datasource.get(table: name, id: id.toString());
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    return ExamModel.fromJson(response['data']);
  }

  @override
  Future<StudentModel> getUser(String id) async {
    final response = await datasource.get(table: 'users', id: id);
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    return StudentModel.fromJson(response['data']);
  }

  @override
  Future<ExamModel> postItem(Map<String, dynamic> jsonData) async {
    final response = await datasource.post(table: name, body: jsonData);
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    return ExamModel.fromJson(response['data']);
  }

  @override
  Future<void> deleteItem(int id) async {
    await datasource.delete(table: name, id: id.toString());
  }
  
  @override
  Future<ExamModel> putItem({required int id, required Map<String, dynamic> jsonData}) async {
    final response = await datasource.put(table: name, id: jsonData['id'], body: jsonData);
    if (response['status'] == false) {
      throw Exception(response['error']);
    }
    return ExamModel.fromJson(response['data']);
  }


}
