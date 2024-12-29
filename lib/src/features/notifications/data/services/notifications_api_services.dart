import 'package:transcriptapp/src/core/constants.dart';
import 'package:transcriptapp/src/shared/datasources/dio_datasource.dart';

class NotificationsApiServices {

  final DioDatasource _dioDatasource;

  NotificationsApiServices(this._dioDatasource);

  Future<Map<String, dynamic>> getNotifications() async {
    return await _dioDatasource.get('${AppConstants.urlApi}/notifications');
  }

  Future<Map<String, dynamic>> getNotification(int id) async {
    return await _dioDatasource.get('${AppConstants.urlApi}/notifications/$id');
  }

  Future<Map<String, dynamic>> postNotification(
      Map<String, dynamic> json) async {
    return await _dioDatasource.post(
      url: '${AppConstants.urlApi}/notifications',
      body: json,
    );
  }

  Future<Map<String, dynamic>> putNotification(
      {required int id, required Map<String, dynamic> json}) async {
    return await _dioDatasource.put(
      url: '${AppConstants.urlApi}/notifications/$id',
      body: json,
    );
  }

  Future<Map<String, dynamic>> deleteNotification(int id) async {
    return await _dioDatasource.delete('${AppConstants.urlApi}/notifications/$id');
  }
}