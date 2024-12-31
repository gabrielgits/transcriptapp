import 'package:transcriptapp/src/shared/datasources/sharedpref_datasource.dart';
import 'package:transcriptapp/src/utils/result.dart';

import 'crud_repository.dart';

class CrudRepositoryRemote<T> implements CrudRepository<T> {
  final SharedPrefDatasource _datasource;
  final String _table;
  final T Function(Map<String, dynamic>) fromJson;

  CrudRepositoryRemote({
    required SharedPrefDatasource datasource,
    required String table,
    required this.fromJson,
  })  : _datasource = datasource,
        _table = table;

  @override
  Future<Result<T>> getItem(int idItem) async {
    try {
      final response =
          await _datasource.getItem(_table, id: idItem);
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
      final response = await _datasource.updateItem(_table, item: (item as dynamic).toJson());
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
          await _datasource.deleteItem(_table, id: idItem);
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
      final response = await _datasource.updateItem(
        _table,
        item: json,
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
      final allItems = await _datasource.getAllItems(_table);

      if (allItems['status'] == false) {
        return Result.error(Exception(allItems['message']));
      }

      final filteredItems = allItems['data']
          .where((item) => filters.entries.every((filter) => item[filter.key] == filter.value))
          .toList();

      final List<T> items = filteredItems.map<T>((json) => fromJson(json)).toList();
      return Result.ok(items);

    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<T>>> getAllItems() async {
    try {
      final response =
          await _datasource.getAllItems(_table);
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
