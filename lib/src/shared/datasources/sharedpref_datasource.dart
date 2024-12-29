import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDatasource {
  Future<bool> saveObject({
    required Map<String, dynamic> item,
    required String key,
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
      {required Map<String, dynamic> item, required String key}) async {
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

  Future<int> saveItem({
    required Map<String, dynamic> item,
    required String key,
  }) async {
    final encodedItem = jsonEncode(item);
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(key)) {
      return await prefs.setStringList(key, [encodedItem]) ? 1 : 0;
    }
    final encodedListGet = prefs.getStringList(key);
    encodedListGet!.add(encodedItem);
    return await prefs.setStringList(key, encodedListGet)
        ? encodedListGet.length
        : 0;
  }

  Future<Map<String, dynamic>> getItem({
    required int id,
    required String table,
  }) async {
    Map<String, dynamic> item = {};
    final prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList(table);
    if (items == null) return item;
    for (var element in items) {
      final itemDecoded = jsonDecode(element);
      if (itemDecoded['id'] == id) {
        item = itemDecoded;
      }
    }
    return item;
  }

  Future<int> updateItem(
      {required Map<String, dynamic> item, required String table}) async {
    final encodedItem = jsonEncode(item);
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(table)) {
      return 0;
    }
    final encodedListGet = prefs.getStringList(table);
    for (int i = 0; i < encodedListGet!.length; i++) {
      final itemDecoded = jsonDecode(encodedListGet[i]);
      if (itemDecoded['id'] == item['id']) {
        encodedListGet[i] = encodedItem;
        return await prefs.setStringList(table, encodedListGet)
            ? item['id']
            : 0;
      }
    }
    return 0;
  }
}
