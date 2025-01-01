import 'package:transcriptapp/src/core/constants.dart';
import 'package:transcriptapp/src/shared/datasources/dio_datasource.dart';

class AttendancesApiServices {

  final DioDatasource _dioDatasorce;

  AttendancesApiServices(this._dioDatasorce);
  
  Future<Map<String, dynamic>> getAttendances(int id) {
    return _dioDatasorce.get('${AppConstants.urlApi}/attendances/student/$id/all');
  }

  Future<Map<String, dynamic>> getAttendanceReport(int id) {
    return _dioDatasorce.get('${AppConstants.urlApi}/attendances/student/$id');
  }

}