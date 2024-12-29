import 'package:transcriptapp/src/core/constants.dart';
import 'package:transcriptapp/src/shared/datasources/dio_datasource.dart';

class DailypointsApiServices {

  final DioDatasource _dioDatasource;

  DailypointsApiServices(this._dioDatasource);


  Future<Map<String, dynamic>> getDailypoints(int id) async {
    return await _dioDatasource.get('${AppConstants.urlApi}/dailypoints/student/$id/all');
  }

  Future<Map<String, dynamic>> getDailypointReport(int id) async {
    return await _dioDatasource.get('${AppConstants.urlApi}/dailypoints/student/$id');
  }
}