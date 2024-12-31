import 'package:transcriptapp/src/core/constants.dart';
import 'package:transcriptapp/src/shared/datasources/dio_datasource.dart';
import 'package:transcriptapp/src/utils/result.dart';

import '../datasources/sharedpref_datasource.dart';
import 'crud_repository.dart';

class CrudRepositoryCached<T> implements CrudRepository<T> {
  final DioDatasource _remoteDatasource;
  final SharedPrefDatasource _localDatasource;
  final String _table;
  final T Function(Map<String, dynamic>) fromJson;

  CrudRepositoryCached({
    required DioDatasource remoteDatasource,
    required SharedPrefDatasource localDatasource,
    required String table,
    required this.fromJson,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource,
        _table = table;

  @override
  Future<Result<T>> getItem(int idItem) async {
    try {
      final remoteResponse =
          await _remoteDatasource.get('${AppConstants.urlApi}/$_table/$idItem');
      if (remoteResponse['status'] == true) {
        final item = fromJson(remoteResponse['data']);
        _localDatasource.updateItem(_table, item: remoteResponse['data']);
        return Result.ok(item);
      }
    } catch (_) {
      // ignore
    }

    try {
      final localResponse = await _localDatasource.getItem(_table, id: idItem);
      if (localResponse['status'] == true) {
        return Result.ok(fromJson(localResponse['data']));
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
    return Result.error(Exception('Item not found'));
  }

    @override
  Future<Result<List<T>>> getAllItems() async {
    try {
      final response =
          await _remoteDatasource.get('${AppConstants.urlApi}/$_table');
      if (response['status'] == true) {
        final List<T> items = (response['data'] as List).map<T>((json) {
          return fromJson(json);
        }).toList();
        return Result.ok(items);
      }
    } catch (_) {
      // ignore
    }

    try {
      final localResponse = await _localDatasource.getAllItems(_table);
      if (localResponse['status'] == true) {
        final List<T> items = (localResponse['data'] as List).map<T>((json) {
          return fromJson(json);
        }).toList();
        return Result.ok(items);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
    return Result.error(Exception('Items not found'));
  }

    @override
  @override
  Future<Result<List<T>>> filterItems(Map<String, dynamic> filters) async {
    try {
      final urlParams =
          filters.entries.map((e) => '${e.key}/${e.value}').join('/');
      String url = '${AppConstants.urlApi}/$_table/$urlParams';

      final remoteResponse = await _remoteDatasource.get(url);
      if (remoteResponse['status'] == true) {
        final List<T> items = (remoteResponse['data'] as List).map<T>((json) {
          return fromJson(json);
        }).toList();
        return Result.ok(items);
      }
    } catch (_) {
      // ignore
    }

    try {
      final localResponse = await _localDatasource.getAllItems(_table);
      if (localResponse['status'] == true) {
        final filteredItems = localResponse['data']
          .where((item) => filters.entries.every((filter) => item[filter.key] == filter.value))
          .toList();
        final List<T> items = filteredItems.map<T>((json) => fromJson(json)).toList();
        return Result.ok(items);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
    return Result.error(Exception('Items not found'));
  }

  @override
  Future<Result<T>> createItem(T item) async {
    try {
      final response = await _remoteDatasource.post(
        '${AppConstants.urlApi}/$_table',
        body: (item as dynamic).toJson(), // Assumes T has `toJson`
      );
      if (response['status'] == false) {
        return Result.error(Exception(response['message']));
      }
      _localDatasource.updateItem(_table, item: response['data']);
      final newItem = fromJson(response['data']);
      return Result.ok(newItem);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<T>> deleteItem(int idItem) async {
    try {
      final response = await _remoteDatasource
          .delete('${AppConstants.urlApi}/$_table/$idItem');
      if (response['status'] == false) {
        return Result.error(Exception(response['message']));
      }
      _localDatasource.deleteItem(_table, id: idItem);
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
      final response = await _remoteDatasource.put(
        '${AppConstants.urlApi}/$_table/$id',
        body: json,
      );
      if (response['status'] == false) {
        return Result.error(Exception(response['message']));
      }
      _localDatasource.updateItem(_table, item: response['data']);
      final item = fromJson(response['data']);
      return Result.ok(item);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }




}
