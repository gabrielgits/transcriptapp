import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDatasource {
  Future<bool> saveObject(
    String key, {
    required Map<String, dynamic> item,
  }) async {
    final encodedItem = jsonEncode(item);
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      throw Exception('Item already exists');
    }
    return await prefs.setString(key, encodedItem);
  }

  Future<Map<String, dynamic>> getObject(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedItem = prefs.getString(key);
    if (encodedItem == null) throw Exception('Item not found');
    return jsonDecode(encodedItem);
  }

  Future<bool> updateObject(
    String key, {
    required Map<String, dynamic> item,
  }) async {
    final encodedItem = jsonEncode(item);
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(key)) {
      throw Exception('Item not found');
    }
    return await prefs.setString(key, encodedItem);
  }

  Future<bool> deleteAll(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  Future<Map<String, dynamic>> saveItem(
    String key, {
    required Map<String, dynamic> item,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedItem = jsonEncode(item);
    final items = prefs.getStringList(key);
    if (items == null) {
      return await prefs.setStringList(key, [encodedItem])
          ? {
              'status': true,
              'message': 'Item saved successfully',
              'data': item,
            }
          : {
              'status': false,
              'message': 'Error saving item',
              'data': null,
            };
    }
    items.add(encodedItem);
    return await prefs.setStringList(key, items)
        ? {
            'status': true,
            'message': 'Item saved successfully',
            'data': item,
          }
        : {
            'status': false,
            'message': 'Error saving item',
            'data': null,
          };
  }

  Future<Map<String, dynamic>> saveAllItems(
    String key, {
    required List<Map<String, dynamic>> items,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final newsEncodedItems = items.map((e) => jsonEncode(e)).toList();
    return await prefs.setStringList(key, newsEncodedItems)
        ? {
            'status': true,
            'message': 'Items saved successfully',
            'data': items,
          }
        : {
            'status': false,
            'message': 'Error saving items',
            'data': null,
          };
  }

  Future<Map<String, dynamic>> replaceAllItems(
    String key, {
    required List<Map<String, dynamic>> items,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final existingItems = prefs.getStringList(key)?.map((e) => jsonDecode(e)).toList() ?? [];

    if (existingItems.isEmpty) {
      return await prefs.setStringList(key, items.map((e) => jsonEncode(e)).toList())
          ? {
              'status': true,
              'message': 'Items saved successfully',
              'data': items,
            }
          : {
              'status': false,
              'message': 'Error saving items',
              'data': null,
            };
    }

    final updatedItems = existingItems.where((existingItem) {
      return !items.any((newItem) {
        return newItem['id'] == existingItem['id'];
      });
    }).toList();

    updatedItems.addAll(items);

    final encodedUpdatedItems = updatedItems.map((e) => jsonEncode(e)).toList();
    return await prefs.setStringList(key, encodedUpdatedItems)
        ? {
            'status': true,
            'message': 'Items replaced successfully',
            'data': items,
          }
        : {
            'status': false,
            'message': 'Error replacing items',
            'data': null,
          };
  }


  Future<Map<String, dynamic>> getItem(
    String table, {
    required dynamic id,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final items = prefs.getStringList(table);
    if (items == null) {
      return {
        'status': false,
        'message': 'table not found',
        'data': null,
      };
    }
    final item = items.firstWhere((element) => jsonDecode(element)['id'] == id,
        orElse: () => '');
    if (item.isEmpty) {
      return {
        'status': false,
        'message': 'Item not found',
        'data': null,
      };
    }
    return {
      'status': true,
      'message': 'Item found successfully',
      'data': jsonDecode(item),
    };
  }

  Future<Map<String, dynamic>> getAllItems(String table) async {
    final prefs = await SharedPreferences.getInstance();
    final items = prefs.getStringList(table);
    if (items == null) {
      return {
        'status': false,
        'message': 'Table not found',
        'data': null,
      };
    }
    return {
      'status': true,
      'message': 'Items found successfully',
      'data': items.map((e) => jsonDecode(e)).toList(),
    };
  }

  Future<Map<String, dynamic>> updateItem(
    String table, {
    required Map<String, dynamic> item,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(table)) {
      return {
        'status': false,
        'message': 'Table not found',
        'data': null,
      };
    }
    final encodedListGet = prefs.getStringList(table)!;
    final index = encodedListGet.indexWhere(
      (element) => jsonDecode(element)['id'] == item['id'],
    );
    if (index == -1) {
      return {
        'status': false,
        'message': 'Item not found',
        'data': null,
      };
    }
    encodedListGet[index] = jsonEncode(item);
    final status = await prefs.setStringList(table, encodedListGet);
    if (status) {
      return {
        'status': true,
        'message': 'Item updated successfully',
        'data': item,
      };
    }
    return {
      'status': false,
      'message': 'Error updating item',
      'data': null,
    };
  }

  Future<Map<String, dynamic>> replaceItem(
    String table, {
    required Map<String, dynamic> item,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(table)) {
      return {
        'status': false,
        'message': 'Table not found',
        'data': null,
      };
    }
    final encodedListGet = prefs.getStringList(table)!;
    final index = encodedListGet.indexWhere(
      (element) => jsonDecode(element)['id'] == item['id'],
    );
    if (index == -1) {
      encodedListGet.add(jsonEncode(item));
      return {
        'status': true,
        'message': 'Item added successfully',
        'data': item,
      };
    }
    encodedListGet[index] = jsonEncode(item);
    final status = await prefs.setStringList(table, encodedListGet);
    if (status) {
      return {
        'status': true,
        'message': 'Item updated successfully',
        'data': item,
      };
    }
    return {
      'status': false,
      'message': 'Error updating item',
      'data': null,
    };
  }

  Future<Map<String, dynamic>> deleteItem(
    String table, {
    required dynamic id,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(table)) {
      return {
        'status': false,
        'message': 'Table not found',
        'data': null,
      };
    }
    final encodedListGet = prefs.getStringList(table);
    final index = encodedListGet!.indexWhere(
      (element) => jsonDecode(element)['id'] == id,
    );
    if (index == -1) {
      return {
        'status': false,
        'message': 'Item not found',
        'data': null,
      };
    }
    encodedListGet.removeAt(index);
    final status = await prefs.setStringList(table, encodedListGet);
    if (status) {
      return {
        'status': true,
        'message': 'Item deleted successfully',
        'data': null,
      };
    }
    return {
      'status': false,
      'message': 'Error deleting item',
      'data': null,
    };
  }
}
