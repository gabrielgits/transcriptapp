import 'package:transcriptapp/src/core/constants.dart';
import 'package:transcriptapp/src/shared/datasources/dio_datasource.dart';
import 'package:transcriptapp/src/utils/result.dart';

import 'crud_repository.dart';

class CrudRepositoryRemote<T> implements CrudRepository<T> {
  final DioDatasource _datasource;
  final String _table;
  final T Function(Map<String, dynamic>) fromJson;

  CrudRepositoryRemote({
    required DioDatasource datasource,
    required String table,
    required this.fromJson,
  })  : _datasource = datasource,
        _table = table;

  @override
  Future<Result<T>> getItem(int idItem) async {
    try {
      final response =
          await _datasource.get('${AppConstants.urlApi}/$_table/$idItem');
      if (response['status'] == false) {
        return Result.error(Exception(response['message']));
      }
      final item = fromJson(response['data']);
      return Result.ok(item);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<T>> createItem(T item) async {
    try {
      final response = await _datasource.post(
        '${AppConstants.urlApi}/$_table',
        body: (item as dynamic).toJson(), // Assumes T has `toJson`
      );
      if (response['status'] == false) {
        return Result.error(Exception(response['message']));
      }
      final newItem = fromJson(response['data']);
      return Result.ok(newItem);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<T>> deleteItem(int idItem) async {
    try {
      final response =
          await _datasource.delete('${AppConstants.urlApi}/$_table/$idItem');
      if (response['status'] == false) {
        return Result.error(Exception(response['message']));
      }
      return Result.ok(fromJson(response['data']));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<T>> updateItem({
    required int id,
    required Map<String, dynamic> json,
  }) async {
    try {
      final response = await _datasource.put(
        '${AppConstants.urlApi}/$_table/$id',
        body: json,
      );
      if (response['status'] == false) {
        return Result.error(Exception(response['message']));
      }
      final item = fromJson(response['data']);
      return Result.ok(item);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<T>>> filterItems(Map<String, dynamic> filters) async {
    try {
      final urlParams =
          filters.entries.map((e) => '${e.key}/${e.value}').join('/');
      String url = '${AppConstants.urlApi}/$_table/$urlParams';

      final response = await _datasource.get(url);
      if (response['status'] == false) {
        return Result.error(Exception(response['message']));
      }
      final List<T> items = (response['data'] as List).map<T>((json) {
        return fromJson(json);
      }).toList();
      return Result.ok(items);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<T>>> getAllItems() async {
    try {
      final response =
          await _datasource.get('${AppConstants.urlApi}/$_table');
      if (response['status'] == false) {
        return Result.error(Exception(response['message']));
      }
      final List<T> items = (response['data'] as List).map<T>((json) {
        return fromJson(json);
      }).toList();
      return Result.ok(items);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
